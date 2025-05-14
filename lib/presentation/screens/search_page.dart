import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/data/repositories/recipes_repository/recipes_repository_impl.dart';
import 'package:recipes_appv2/presentation/providers/recipes_providers/recipes_provider.dart';
import 'package:recipes_appv2/presentation/widgets/categories/search_bar.dart';
import 'package:recipes_appv2/presentation/widgets/commons/appBarCustom.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultsRecipes = ref.watch(searchRecipesProvider);
    final recipesRepositoryImpl = ref.watch(recipesRepositoryProvider);
    debugPrint("Search Results: $resultsRecipes");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Appbarcustom(
            title: 'Categories',
            isBackButtonVisible: true,
            isTitleVisible: true),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              // ignore: void_checks
              child: SearchBarCustom(
                onSearch: (value) {
                recipesRepositoryImpl.searchRecipes(value, ref);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: resultsRecipes.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        dense: false,
                        title: Text(resultsRecipes[index].strMeal,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF676767))),
                        onTap: () {
                          context.push('/recipe', extra: resultsRecipes[index]);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ));
  }
}

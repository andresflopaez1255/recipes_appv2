import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/data/repositories/categories_repository_impl/categories_repository_impl.dart';
import 'package:recipes_appv2/data/repositories/recipes_repository/recipes_repository_impl.dart';
import 'package:recipes_appv2/data/source_data/network_source.dart';
import 'package:recipes_appv2/presentation/providers/categories_providers/categories_provider.dart';
import 'package:recipes_appv2/presentation/providers/navigation_providers/navigation_provider.dart';
import 'package:recipes_appv2/presentation/widgets/categories/search_bar.dart';
import 'package:recipes_appv2/presentation/widgets/commons/appBarCustom.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  late final CategoriesRepositoryImpl categoriesRepository;
  @override
  void initState() {
    categoriesRepository = ref.read(categoriesRepositoryProvider);
    super.initState();
    _fetchCategories();

  }

  void _fetchCategories() async {
    await categoriesRepository.fetchCategories(ref);
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustom(
        title: 'Categories',
        isBackButtonVisible: true,
        isTitleVisible: true,
        onBackPressed: () {
          ref.read(navigationProvider.notifier).setIndex(0);
          context.go('/home');
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SearchBarCustom(
              onSearch: (value) {
                RecipesRepositoryImpl(networkSource: NetworkSource())
                    .searchRecipes(value, ref);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      dense: false,
                      title: Text(
                        categories[index].strCategory,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF676767),
                        ),
                      ),
                      onTap: () {
                        context.push('/recipe', extra: []);
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
          ),
        ],
      ),
    );
  }
}
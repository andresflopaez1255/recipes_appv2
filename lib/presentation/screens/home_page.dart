import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/repositories/recipes_repository_impl.dart';
import 'package:recipes_appv2/data/source_data/network_source.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:recipes_appv2/presentation/providers/recipes_providers/recipes_provider.dart';
import 'package:recipes_appv2/presentation/widgets/carrousel_home/carrousel_home.dart';
import 'package:recipes_appv2/presentation/widgets/recipes/recipe_item.dart';
import 'package:recipes_appv2/presentation/widgets/recipes/recipes_list.dart';
import 'package:recipes_appv2/presentation/widgets/skeletons/recipes/skeleton_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    RecipesRepositoryImpl(networkSource: NetworkSource()).fetchRecipes(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final randomRecipes = ref.watch(recipesProvider);
    return Scaffold(
        body: randomRecipes.isEmpty
            ? SkeletonHome()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Carousel(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: const RecipesList(),
                    ),
                  ],
                ),
              ));
  }
}

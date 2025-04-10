import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/source_data/network_source.dart';
import 'package:recipes_appv2/presentation/providers/recipes_providers/recipes_provider.dart';

import '../../domain/entities/recipes.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../models/recipes_models.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final NetworkSource networkSource;

  RecipesRepositoryImpl({required this.networkSource});

  @override
  Future<Recipe> fetchRecipeById(String id) {
    // TODO: implement fetchRecipeById
    throw UnimplementedError();
  }

  @override
  fetchRecipes(WidgetRef ref) async {
    final responseJson = await networkSource.get("search.php?f=b");
    final recipesJson = responseJson.data as Map<String, dynamic>;
    final meals = (recipesJson['meals'] as List)
        .map((mealJson) =>
            RecipeModel.fromJson(mealJson as Map<String, dynamic>))
        .toList();

    ref.read(recipesProvider.notifier).setRecipes(meals);
    fetchRandomRecipe(ref, meals);
  }

  @override
  fetchRandomRecipe(WidgetRef ref, List<Recipe> data) async {
    ref.read(randomRecipesProvider.notifier).getRandomRecipes(data);
  }
}

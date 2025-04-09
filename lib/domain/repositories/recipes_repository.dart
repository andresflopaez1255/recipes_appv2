import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';

abstract class RecipesRepository {
  /// Fetches a list of recipes.
  fetchRecipes(WidgetRef ref);

  /// Fetches a single recipe by its ID.
  Future<Recipe> fetchRecipeById(String id);

  /// Adds a new recipe.
  
}
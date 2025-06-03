import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:recipes_appv2/data/models/recipes_models.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalFavoritesSource {
  static const String _key = 'favorites';

  Future<void> addFavorite(Recipe favoriteRecipe) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    final recipeJson = jsonEncode(favoriteRecipe);
    if (!favorites.contains(recipeJson)) {
      favorites.add(recipeJson);
      await prefs.setStringList(_key, favorites);
    }
  }

  Future<void> removeFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    favorites.removeWhere((item) {
      final recipe = RecipeModel.fromJson(jsonDecode(item));
      return recipe.idMeal == recipeId;
    });
    await prefs.setStringList(_key, favorites);
  }

  Future<List<Recipe>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    debugPrint('Favorites: $favorites');
    final favoritiesJson = favorites
        .map((item) => RecipeModel.fromJson(jsonDecode(item)))
        .toList();
    return favoritiesJson;
  }

  Future<bool> isFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    return favorites.any((item) {
      final recipe = RecipeModel.fromJson(jsonDecode(item));
      return recipe.idMeal == recipeId;
    });
  }
}

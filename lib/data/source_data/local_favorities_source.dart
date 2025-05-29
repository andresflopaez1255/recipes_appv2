
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalFavoritesSource {
  static const String _key = 'favorites';

  Future<void> addFavorite(Recipe favoriteRecipe) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    if (!favorites.contains(favoriteRecipe.idMeal)) {
      favorites.add(favoriteRecipe.idMeal);
      await prefs.setStringList(_key, favorites);
    }
  }

  Future<void> removeFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    if (favorites.contains(recipeId)) {
      favorites.remove(recipeId);
      await prefs.setStringList(_key, favorites);
    }
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<bool> isFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    return favorites.contains(recipeId);
  }
}

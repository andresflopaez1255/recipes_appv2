import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';

abstract class CategoriesRepository {
  fetchCategories(WidgetRef ref);
  searchCategories(String query, WidgetRef ref);
  Future<List<RecipeCategory>> findRecipesByCategory(String query, WidgetRef ref);
  String countRecipesByCat(String query, WidgetRef ref);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/models/categories_models.dart';
import 'package:recipes_appv2/data/source_data/network_source.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:recipes_appv2/domain/repositories/categories_repository.dart';
import 'package:recipes_appv2/presentation/providers/categories_providers/categories_provider.dart';
import 'package:recipes_appv2/presentation/providers/networksource_provider.dart';
import 'package:recipes_appv2/presentation/providers/recipes_providers/recipes_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_repository_impl.g.dart';

@riverpod
CategoriesRepositoryImpl categoriesRepository(Ref ref) {
  final networkSource = ref.read(networkSourceProvider);
  return CategoriesRepositoryImpl(networkSource: networkSource);
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  final NetworkSource networkSource;

  CategoriesRepositoryImpl({required this.networkSource});
  @override
  fetchCategories(WidgetRef ref) async {
    try {
      final responseJson = await networkSource.get("categories.php");
      final categoriesJson = responseJson.data as Map<String, dynamic>;
      final categories = (categoriesJson['categories'] as List)
          .map((categoryJson) =>
              CategoriesModel.fromJson(categoryJson as Map<String, dynamic>))
          .toList();
      ref.read(categoriesProvider.notifier).setCategories(categories);
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }

  @override
  searchCategories(String query, WidgetRef ref) {
    try {
      ref.read(categoriesProvider.notifier).filterCategories(query);
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }

  @override
  countRecipesByCat(String query, WidgetRef ref) {
    final recipesByCategory = ref.read(categoriesProvider);

    return recipesByCategory
        .where((category) => category.strCategory == query)
        .map((category) => category.strCategory)
        .toList()
        .length
        .toString();
  }

  @override
  Future<List<RecipeCategory>> findRecipesByCategory(
      String query, WidgetRef ref) async {
    try {
      final resposeJson = await networkSource.get("filter.php?c=$query");
      final recipesJson = resposeJson.data as Map<String, dynamic>;
      final categories = (recipesJson['meals'] as List)
          .map((recipeJson) =>
              RecipeCategoryModel.fromJson(recipeJson as Map<String, dynamic>))
          .toList();
      ref
          .read(recipesByCategoryProvider.notifier)
          .setRecipesByCategory(categories);
      return categories;
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }

   
}

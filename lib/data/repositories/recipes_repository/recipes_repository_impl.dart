import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/source_data/network_source.dart';
import 'package:recipes_appv2/presentation/providers/networksource_provider.dart';
import 'package:recipes_appv2/presentation/providers/recipes_providers/recipes_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/repositories/recipes_repository.dart';
import '../../models/recipes_models.dart';

part 'recipes_repository_impl.g.dart';



@riverpod
RecipesRepositoryImpl recipesRepository(Ref ref) {
  final networkSource = ref.read(networkSourceProvider);
  return RecipesRepositoryImpl(networkSource: networkSource);
}

class RecipesRepositoryImpl implements RecipesRepository {
  final NetworkSource networkSource;

  RecipesRepositoryImpl({required this.networkSource});


  @override
  fetchRecipesByLetter(String letter, WidgetRef ref) async {
    final responseJson = await networkSource.get("search.php?f=$letter");
    final recipesJson = responseJson.data as Map<String, dynamic>;

    final meals = (recipesJson['meals'] as List)
        .map((mealJson) =>
            RecipeModel.fromJson(mealJson as Map<String, dynamic>))
        .toList();

    ref.read(recipesProvider.notifier).setRecipes(meals);
  }

  @override
  searchRecipes(String query, WidgetRef ref) async {
    final responseJson = await networkSource.get("search.php?s=$query");
    final recipesJson = responseJson.data as Map<String, dynamic>;

    final meals = (recipesJson['meals']as List)
        .map((mealJson) =>
            RecipeModel.fromJson(mealJson as Map<String, dynamic>))
        .toList();

    ref.read(searchRecipesProvider.notifier).setSearchRecipes(meals);
  }
}

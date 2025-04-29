import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';

abstract class RecipesRepository {
 
  /// Fetches a single recipe by its ID.
  Future<Recipe> fetchRecipeById(String id);




 fetchRecipesByLetter( String letter, WidgetRef ref);
 
 
  
  
}
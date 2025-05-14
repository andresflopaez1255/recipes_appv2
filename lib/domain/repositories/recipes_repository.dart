import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RecipesRepository {
 


  searchRecipes(String query, WidgetRef ref);


 fetchRecipesByLetter( String letter, WidgetRef ref);
 
 
  
  
}
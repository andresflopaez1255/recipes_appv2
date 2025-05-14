import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:recipes_appv2/utils/random_recipes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_provider.g.dart';


@riverpod
class RandomRecipes extends _$RandomRecipes {
  @override
  List<Recipe> build() {
    return [];
  }

  getRandomRecipes(List<Recipe> data) {
    if (data.isEmpty) {
      state = [];
    }
    state = RandomRecipesUtils(data).getRandomRecipes(4);
  }
}


@riverpod
class SearchRecipes extends _$SearchRecipes {
  @override
  List<Recipe>  build() {
    return  [];
  }

  void setSearchRecipes(List<Recipe> recipes) {
    state = recipes;
  }
  void clearSearchRecipes() {
    state = [];
  }
}



@riverpod
class Recipes extends _$Recipes {
  @override
  List<Recipe> build() {
    return [];
  }
   void setRecipes(List<Recipe> recipes) {
    state = [...state, ...recipes];
  }

}

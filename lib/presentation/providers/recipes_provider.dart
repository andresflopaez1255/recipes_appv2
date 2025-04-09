import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_provider.g.dart';

@riverpod
class Recipes extends _$Recipes {
  @override
  List<Recipe> build() {
    return [];
  }

   setRecipes(List<Recipe> data)  {
    state = data;
  }
}

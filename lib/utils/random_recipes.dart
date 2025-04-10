import 'dart:math';

import 'package:recipes_appv2/domain/entities/recipes.dart';


class RandomRecipesUtils {
  final List<Recipe> _recipes;

  RandomRecipesUtils(this._recipes);

  List<Recipe> getRandomRecipes(int count) {
    if (count <= 0) return [];
    final random = Random();
    final shuffled = _recipes.toList()..shuffle(random);
    return shuffled.take(count).toList();
  }
}


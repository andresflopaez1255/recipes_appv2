import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@Riverpod(
  keepAlive: true,
)
class Favorites extends _$Favorites {
  @override
  List<Recipe> build() {
    return [];
  }

  void setFavorities(List<Recipe> favorities) {
    state = favorities;
  }
}

@riverpod
class FavoriteMark extends _$FavoriteMark {
  @override
  bool build() {
    return false;
  }

  void isFavorite(String recipeId) {
    final stateFavorities = ref.watch(favoritesProvider);
    final isFavorite =
        stateFavorities.any((recipe) => recipe.idMeal == recipeId);
    state = isFavorite;
  }
}

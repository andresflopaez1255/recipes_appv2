import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/source_data/local_favorities_source.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:recipes_appv2/presentation/providers/favorites_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repository.g.dart';

@riverpod
FavoritesRepositoryImpl favoritiesRepository(Ref ref) {
  return FavoritesRepositoryImpl(
    localSource: LocalFavoritesSource(),
  );
}

class FavoritesRepositoryImpl {
  final LocalFavoritesSource _localSource;

  FavoritesRepositoryImpl({LocalFavoritesSource? localSource})
      : _localSource = localSource ?? LocalFavoritesSource();

  Future<void> addFavorite(Recipe recipe, WidgetRef ref) async {
    await _localSource.addFavorite(recipe);
    final favorities = await _localSource.getFavorites();
    ref.read(favoritesProvider.notifier).setFavorities(favorities);
    ref.read(favoriteMarkProvider.notifier).isFavorite(recipe.idMeal);
  }

  Future<void> removeFavorite(String recipeId, WidgetRef ref) async {
    await _localSource.removeFavorite(recipeId);
    final favorities = await _localSource.getFavorites();
    ref.read(favoritesProvider.notifier).setFavorities(favorities);
    ref.read(favoriteMarkProvider.notifier).isFavorite(recipeId);
  }

  void getFavorites(WidgetRef ref) async {
    final favorites = await _localSource.getFavorites();
    ref.read(favoritesProvider.notifier).setFavorities(favorites);
  }

  Future<bool> isFavorite(String recipeId) async {
    return await _localSource.isFavorite(recipeId);
  }
}

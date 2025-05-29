import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('FavoritesProvider', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

   /*  test('should add a recipe to favorites', () {
      final notifier = container.read(favoritesProvider.notifier);
      notifier.toggleFavorite(testRecipe);

      final favorites = container.read(favoritesProvider);
      expect(favorites, contains(testRecipe));
    }); */
/* 
    test('should remove a recipe from favorites', () {
      final notifier = container.read(favoritesProvider.notifier);
      notifier.toggleFavorite(testRecipe); // Add
      notifier.toggleFavorite(testRecipe); // Remove

      final favorites = container.read(favoritesProvider);
      expect(favorites, isNot(contains(testRecipe)));
    });

    test('should check if a recipe is favorite', () {
      final notifier = container.read(favoritesProvider.notifier);
      notifier.toggleFavorite(testRecipe);

      final isFavorite = notifier.isFavorite(testRecipe);
      expect(isFavorite, isTrue);
    }); */
  });
}

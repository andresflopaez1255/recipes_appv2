// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesHash() => r'2f1ac7e883814262468dd6246e2d9629914157ba';

/// See also [Favorites].
@ProviderFor(Favorites)
final favoritesProvider = NotifierProvider<Favorites, List<Recipe>>.internal(
  Favorites.new,
  name: r'favoritesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoritesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Favorites = Notifier<List<Recipe>>;
String _$favoriteMarkHash() => r'273a88bf63d5f0861a1ef1b13b898a405dedc5bf';

/// See also [FavoriteMark].
@ProviderFor(FavoriteMark)
final favoriteMarkProvider =
    AutoDisposeNotifierProvider<FavoriteMark, bool>.internal(
  FavoriteMark.new,
  name: r'favoriteMarkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoriteMarkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteMark = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

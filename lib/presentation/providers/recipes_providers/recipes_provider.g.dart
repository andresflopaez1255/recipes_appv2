// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipesHash() => r'65fdb011e08696493df4575dd8f0b1b75e07fb8e';

/// See also [Recipes].
@ProviderFor(Recipes)
final recipesProvider =
    AutoDisposeNotifierProvider<Recipes, List<Recipe>>.internal(
  Recipes.new,
  name: r'recipesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recipesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Recipes = AutoDisposeNotifier<List<Recipe>>;
String _$randomRecipesHash() => r'014d92175fede6ebcc12ce70aec7b5588bde9480';

/// See also [RandomRecipes].
@ProviderFor(RandomRecipes)
final randomRecipesProvider =
    AutoDisposeNotifierProvider<RandomRecipes, List<Recipe>>.internal(
  RandomRecipes.new,
  name: r'randomRecipesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomRecipesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RandomRecipes = AutoDisposeNotifier<List<Recipe>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

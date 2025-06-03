import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/repositories/favorites_repository.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';
import 'package:recipes_appv2/presentation/providers/favorites_provider.dart';

class ImageRecipe extends ConsumerWidget {
  final Recipe meal;
  const ImageRecipe({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.any((fav) => fav.idMeal == meal.idMeal);
    final favoriteRepository = ref.watch(favoritiesRepositoryProvider);

    return Stack(
      children: [
        Container(
          height: 330,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(meal.strMealThumb),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(80), BlendMode.darken),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 10,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Positioned(
          top: 16,
          right: 10,
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
              size: 30,
            ),
            onPressed: () async {
              if (isFavorite) {
                await favoriteRepository.removeFavorite(meal.idMeal, ref);
              } else {
                await favoriteRepository.addFavorite(meal, ref);
              }
            },
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.strMeal,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.category, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    meal.strCategory,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

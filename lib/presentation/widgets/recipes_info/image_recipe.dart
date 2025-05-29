import 'package:flutter/material.dart';
import 'package:recipes_appv2/data/source_data/local_favorities_source.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';

class ImageRecipe extends StatelessWidget {
  final Recipe meal;
  final bool isFavorite;
  const ImageRecipe({super.key, required this.meal, required this.isFavorite});
  @override
  Widget build(BuildContext context) {
      debugPrint('ImageRecipe: ${isFavorite}'); // Debugging line to check meal name
      
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
            onPressed: () {
              if (isFavorite) {
                LocalFavoritesSource().removeFavorite(meal.idMeal); // Cambia a idMeal
              } else {
                LocalFavoritesSource().addFavorite(meal); // Cambia a idMeal
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
                meal.strMeal, // Use the meal's name
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.category, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    meal.strCategory, // Use the meal's category
                    style: TextStyle(color: Colors.white),
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

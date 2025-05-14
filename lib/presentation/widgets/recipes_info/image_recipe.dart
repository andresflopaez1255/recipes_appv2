import 'package:flutter/material.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';

class ImageRecipe extends StatelessWidget {
  final Recipe meal;
  const ImageRecipe({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
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

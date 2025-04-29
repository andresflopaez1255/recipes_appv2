import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.meals, required this.index,
  });

  final List<Recipe> meals;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/recipe',extra: meals[index]); 
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Image.network(
              meals[index].strMealThumb, // Replace with actual image URL
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withAlpha(150), // Dark overlay
            ),
            Positioned(
              bottom: 16,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      meals[index].strMeal, // Replace with actual title
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    meals[index].strCategory, // Replace with actual category
                    style: TextStyle(color: Color(0xFFFFAC70), fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

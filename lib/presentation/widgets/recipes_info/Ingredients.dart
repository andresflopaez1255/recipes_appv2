// ignore: file_names
import 'package:flutter/material.dart';
import 'package:recipes_appv2/domain/entities/recipes.dart';

class IngredientsAndMeausures extends StatelessWidget {
  final Recipe meal;
  const IngredientsAndMeausures({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 18,
      ),
      child: Column(
        
        children: [
          for (int i = 0; i < meal.ingredients.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, size: 12, color: Color(0xFFF58534)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        meal.ingredients[i], // Use the ingredient at index i
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Text(
                  meal.measures[i], // Use the measure at index i
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
         
         
        ],
      ),
    );
  }
}

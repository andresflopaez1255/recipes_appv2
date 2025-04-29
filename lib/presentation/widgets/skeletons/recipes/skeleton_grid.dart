import 'package:flutter/material.dart';
import 'package:recipes_appv2/presentation/widgets/recipes/recipe_item.dart';
import 'package:recipes_appv2/utils/fake_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonGrid extends StatelessWidget {
  const SkeletonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
    
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5, // Altura dinámica
              child:  GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                        color: Colors.grey[300],
                        child: RecipeItem(meals: meals, index: index));
                  },
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}

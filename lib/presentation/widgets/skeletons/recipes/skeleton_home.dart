import 'package:flutter/material.dart';
import 'package:recipes_appv2/presentation/widgets/recipes/recipe_item.dart';
import 'package:recipes_appv2/utils/fake_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonHome extends StatelessWidget {
  const SkeletonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Skeletonizer(
                  enabled: true,
                  enableSwitchAnimation: true,
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    color: Colors.grey[500],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.5, // Altura dinámica
                    child: Skeletonizer(
                      enabled: true,
                      enableSwitchAnimation: true,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Skeletonizer(
                            enabled: true,
                            enableSwitchAnimation: true,
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                child: Container(
                                    color: Colors.grey[300],
                                    child: RecipeItem(
                                        meals: meals, index: index))),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          
  }
}
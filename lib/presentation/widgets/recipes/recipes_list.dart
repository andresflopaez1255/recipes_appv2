import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/repositories/recipes_repository_impl.dart';
import 'package:recipes_appv2/data/source_data/network_source.dart';
import 'package:recipes_appv2/presentation/providers/recipes_provider.dart';

class RecipesList extends ConsumerStatefulWidget {
  const RecipesList({super.key});

  @override
  ConsumerState<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends ConsumerState<RecipesList> {
  @override
  void initState() {
    RecipesRepositoryImpl(networkSource: NetworkSource()).fetchRecipes(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(recipesProvider);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.75,
      ),
      itemCount: meals.length, // Replace with actual item count from provider
      itemBuilder: (context, index) {
        return ClipRRect(
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
                      style: TextStyle(color: Color(0xFFFFAC70),fontSize: 14),
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

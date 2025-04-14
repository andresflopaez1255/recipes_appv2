import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/presentation/providers/carrousel_providers/carrousel_provider.dart';
import 'package:recipes_appv2/presentation/providers/recipes_providers/recipes_provider.dart';

import 'carrousel_item.dart';

class Carousel extends ConsumerWidget {
  const Carousel({super.key});

    @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    final randomRecipes = ref.watch(randomRecipesProvider);
    final carrouselProvider = ref.watch(carouselProviderProvider);
    return  Stack(
            children: [
              SizedBox(
                height: 350,
                child: PageView.builder(
                  itemCount: randomRecipes.length,
                  onPageChanged: (index) {
                    ref.read(carouselProviderProvider.notifier).setPage(index);
                  },
                  itemBuilder: (context, index) {
                    return CarouselItem(
                      image: randomRecipes[index].strMealThumb,
                      title: randomRecipes[index].strMeal,
                      likes: "120 guardados", // Placeholder for likes
                      category: randomRecipes[index].strCategory,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(randomRecipes.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 10.0),
                      width: carrouselProvider == index ? 12.0 : 8.0,
                      height: carrouselProvider == index ? 12.0 : 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            carrouselProvider == index ? Colors.red : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
  }
}



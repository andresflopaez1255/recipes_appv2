import 'package:flutter/material.dart';
import 'package:recipes_appv2/presentation/widgets/carrousel_home/carrousel_home.dart';
import 'package:recipes_appv2/presentation/widgets/recipes/recipes_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Carousel(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
              child: RecipesList(), // RecipesList ahora se ajusta dentro del scroll
            ),
          ],
        ),
      ),
    );
  }
}
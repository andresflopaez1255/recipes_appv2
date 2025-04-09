import 'package:flutter/material.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
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
      itemCount: 10,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Stack(
            children: [
              Image.network(
                "https://www.themealdb.com/images/media/meals/yypwwq1511304979.jpg",
                width: 200,
                height: 2250,
                fit: BoxFit.cover,
              ),
              Container(
                width: 200,
                height: 400,
                color: Colors.black.withAlpha(128), // Superposición oscura
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "title",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.category, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          " category",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
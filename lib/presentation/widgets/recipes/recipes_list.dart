import 'package:flutter/material.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true, // Añadir shrinkWrap para que GridView se ajuste a su contenido
        physics: NeverScrollableScrollPhysics(), // Desactivar el desplazamiento del GridView
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de columnas
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75, // Ajusta la relación de aspecto según tus necesidades
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
                        Text(
                          "title",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
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
            ),
          );
        },
      ),
    );
  }
}
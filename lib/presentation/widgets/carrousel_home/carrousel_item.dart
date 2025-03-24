import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String image;
  final String title;
  final String likes;
  final String category;

  const CarouselItem({
    super.key,
    required this.image,
    required this.title,
    required this.likes,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(150), BlendMode.darken),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.red,
            child: Text(
              'Popular',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
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
                    category,
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarouselItem extends StatelessWidget {
  final String image;
  final String title;
  final String category;

  const CarouselItem({
    super.key,
    required this.image,
    required this.title,
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
                  Colors.black.withAlpha(120), BlendMode.darken),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 16,
          child: Container(
            width: 86,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            alignment: Alignment.center,
            child: Text(
              'Popular',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: IconButton(
                onPressed: () {
                  context.go( '/search');
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 32,
                )),
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

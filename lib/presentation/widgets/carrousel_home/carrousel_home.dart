import 'package:flutter/material.dart';
import 'package:recipes_appv2/presentation/widgets/carrousel_home/carrousel_item.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<Map<String, String>> items = [
    {
      'image':
          'https://mccormick.widen.net/content/5pgmsri5uh/png/Pie%20de%20Manzana.png?crop=true&anchor=341,0&color=ffffff00&u=u0bb0o&w=1365&h=1365',
      'title': 'Pay de manzana',
      'likes': '120 guardados',
      'category': 'Postres',
    },

    {
      'image':
          'https://mccormick.widen.net/content/5pgmsri5uh/png/Pie%20de%20Manzana.png?crop=true&anchor=341,0&color=ffffff00&u=u0bb0o&w=1365&h=1365',
      'title': 'Pay de manzana',
      'likes': '120 guardados',
      'category': 'Postres',
    },
    // Puedes agregar más elementos aquí
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 350,
          child: Expanded(
            flex: 3,
            child: PageView.builder(
              itemCount: items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return CarouselItem(
                  image: items[index]['image']!,
                  title: items[index]['title']!,
                  likes: items[index]['likes']!,
                  category: items[index]['category']!,
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(items.length, (index) {
              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                width: _currentIndex == index ? 12.0 : 8.0,
                height: _currentIndex == index ? 12.0 : 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.red : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

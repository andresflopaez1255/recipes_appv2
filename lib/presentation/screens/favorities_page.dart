import 'package:flutter/material.dart';
import 'package:recipes_appv2/presentation/widgets/commons/appBarCustom.dart';

class FavoritiesPage extends StatelessWidget {
  const FavoritiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustom(
        title: 'Favorities',
        isBackButtonVisible: true,
        isTitleVisible: true,
      
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.grey[200],
                  ),
                  child: Image.network(
                    "https://www.themealdb.com/images/media/meals/kvbotn1581012881.jpg",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      "Chicken Teriyaki",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Japanese',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xffF95F5F),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 84,
                  width: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xffF95F5F),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      )),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

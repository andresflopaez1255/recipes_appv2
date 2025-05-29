import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonSearchResults extends StatelessWidget {
  const SkeletonSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Ajusta la altura según tu diseño
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Card(
                color: Colors.grey[200],
               
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                elevation: 0,
                
                child: Row(
                  children: [
                      SizedBox(
                        height: 60,
                      
                       width: 300,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Center(
                              child: Text(
                                "....................................................................................", // Placeholder text
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ),
                  
                  ],
                ),
              ),
            );
          },
      )),
    );
  }
}

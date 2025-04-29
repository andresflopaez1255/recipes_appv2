import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonCarousel extends StatelessWidget {
  const SkeletonCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: Container(
        height: 350,
        width: double.infinity,
        color: Colors.grey[500],
      ),
    );
  }
}

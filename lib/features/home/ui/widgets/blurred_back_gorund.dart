import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackGroundImage extends StatelessWidget {
  const BlurredBackGroundImage({super.key, required this.homeWidgets});
  final Widget homeWidgets;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(fit: StackFit.expand, children: [
          ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Image.asset(
                'assets/images/home_back_ground_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          homeWidgets,
        ]));
  }
}
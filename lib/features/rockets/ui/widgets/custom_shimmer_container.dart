import 'package:flutter/material.dart';

class ShimmerCustomContainer extends StatelessWidget {
  const ShimmerCustomContainer({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../design_system.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({
    super.key,
    this.height = 16,
    this.width,
    this.backgroundColor,
    this.radius = 4,
  });

  final double height;
  final double? width;
  final Color? backgroundColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? MonoChromaticColors.skeleton,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

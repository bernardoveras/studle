import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
    return Shimmer.fromColors(
      baseColor: MonoChromaticColors.skeleton,
      highlightColor: MonoChromaticColors.gray.v200,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? MonoChromaticColors.skeleton,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

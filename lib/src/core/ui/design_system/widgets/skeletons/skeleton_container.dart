import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../design_system.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({
    super.key,
    this.height = 16,
    this.width,
    this.baseColor,
    this.highlightColor,
    this.radius = 4,
    this.shape,
  });

  final double height;
  final double? width;
  final Color? baseColor;
  final Color? highlightColor;
  final double radius;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? MonoChromaticColors.skeleton,
      highlightColor: highlightColor ?? MonoChromaticColors.gray.v200,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          color: baseColor ?? MonoChromaticColors.skeleton,
          borderRadius: shape != null ? null : BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

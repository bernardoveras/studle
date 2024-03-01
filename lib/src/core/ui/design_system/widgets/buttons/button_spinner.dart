import 'package:flutter/material.dart';

import '../../design_system.dart';

class ButtonSpinner extends StatelessWidget {
  ButtonSpinner({
    super.key,
    Color? color,
    this.height = 20,
    this.width = 20,
  }) : color = color ?? MonoChromaticColors.white;

  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2.5,
      ),
    );
  }
}

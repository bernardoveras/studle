import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get maxHeight => MediaQuery.sizeOf(this).height;
  double get maxWidth => MediaQuery.sizeOf(this).width;
  double get topPadding => MediaQuery.paddingOf(this).top;
  double get bottomPadding => MediaQuery.paddingOf(this).bottom;
}

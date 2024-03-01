import 'package:flutter/material.dart' show FontWeight, TextStyle;

class Text2Typography extends TextStyle {
  const Text2Typography({
    super.inherit = true,
    super.color,
    super.backgroundColor,
    super.fontStyle,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
    FontWeight fontWeight = FontWeight.normal,
  }) : super(
          fontWeight: fontWeight,
          fontSize: 16,
        );
}

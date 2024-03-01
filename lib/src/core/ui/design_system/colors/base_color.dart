import 'package:flutter/material.dart';

import '../exceptions/color_not_found_exception.dart';
import 'hex_color.dart';

final class BaseColor extends ColorSwatch<int> {
  BaseColor(
    Map<int, String> swatchHex, {
    this.primary = 500,
  })  : swatch = swatchHex.map(
          (key, value) => MapEntry<int, Color>(key, HexColor.fromHex(value)),
        ),
        super(
          HexColor.fromHex(swatchHex[primary]!).value,
          swatchHex.map((k, v) => MapEntry<int, Color>(k, HexColor.fromHex(v))),
        );

  final int primary;
  final Map<int, Color> swatch;

  Color get v25 => _getVariation(25);
  Color get v50 => _getVariation(50);
  Color get v100 => _getVariation(100);
  Color get v200 => _getVariation(200);
  Color get v300 => _getVariation(300);
  Color get v400 => _getVariation(400);
  Color get v500 => _getVariation(500);
  Color get v600 => _getVariation(600);
  Color get v700 => _getVariation(700);
  Color get v800 => _getVariation(800);
  Color get v900 => _getVariation(900);

  Color _getVariation(int variation) {
    if (swatch[variation] == null) {
      throw ColorNotFoundException();
    }

    return swatch[variation]!;
  }
}

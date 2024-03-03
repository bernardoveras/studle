import 'package:flutter/material.dart';

import 'base_color.dart';

final class MonoChromaticColors {
  static Color get white => Colors.white;
  static Color get backgroundColor => Colors.white;
  static Color get transparent => Colors.transparent;

  static BaseColor get gray => BaseColor(
        const <int, String>{
          25: '#FCFCFD',
          50: '#F9FAFB',
          100: '#F2F4F7',
          200: '#EAECF0',
          300: '#D0D5DD',
          400: '#98A2B3',
          500: '#667085',
          600: '#475467',
          700: '#344054',
          800: '#1D2939',
          900: '#101828',
        },
      );
}

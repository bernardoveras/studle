import 'package:flutter/material.dart';

import 'base_color.dart';

final class MonoChromaticColors {
  static Color get white => Colors.white;
  static Color get transparent => Colors.transparent;

  static BaseColor get light => BaseColor(
        const <int, String>{
          100: '#FCFCFD',
          200: '#F9FAFB',
          300: '#F2F4F7',
          400: '#EAECF0',
          500: '#D0D5DD',
        },
      );

  static BaseColor get dark => BaseColor(
        const <int, String>{
          100: '#98A2B3',
          200: '#667085',
          300: '#475467',
          400: '#344054',
          500: '#1D2939',
          600: '#101828',
        },
      );
}

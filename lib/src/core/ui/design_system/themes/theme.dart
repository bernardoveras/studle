import 'package:flutter/material.dart';

import '../colors/colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: MonoChromaticColors.dark,
      shape: Border(
        bottom: BorderSide(
          color: MonoChromaticColors.light.v300,
          width: 2,
        ),
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: MonoChromaticColors.dark,
      ),
      centerTitle: true,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PrimaryColors.brand,
      background: Colors.white,
      onBackground: MonoChromaticColors.dark,
    ),
  );
}

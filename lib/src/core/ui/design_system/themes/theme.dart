import 'package:flutter/material.dart';

import '../colors/colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: false,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: MonoChromaticColors.gray.v800,
      actionsIconTheme: IconThemeData(
        color: MonoChromaticColors.gray,
      ),
      iconTheme: IconThemeData(
        color: MonoChromaticColors.gray,
      ),
      shape: Border(
        bottom: BorderSide(
          color: MonoChromaticColors.gray.v100,
          width: 2,
        ),
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: MonoChromaticColors.gray.v800,
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
      onBackground: MonoChromaticColors.gray.v800,
    ),
  );
}

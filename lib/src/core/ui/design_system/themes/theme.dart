import 'package:flutter/material.dart';

import '../design_system.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: false,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: MonoChromaticColors.gray.v700.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const Button3Typography(
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColors.brand,
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
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
          color: MonoChromaticColors.divider,
          width: 1.5,
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

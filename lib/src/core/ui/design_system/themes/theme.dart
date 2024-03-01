import 'package:flutter/material.dart';
import 'package:myschool/src/core/ui/design_system/colors/primary_colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: PrimaryColors.brand),
    useMaterial3: false,
  );
}

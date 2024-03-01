import 'package:flutter/material.dart';

import '../../design_system.dart';

enum IconButtonType { solid, outlined }

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton._({
    super.key,
    required this.icon,
    this.onPressed,
    this.loading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.type = IconButtonType.solid,
    this.size = 56,
  });

  factory DefaultIconButton.outlined({
    Key? key,
    VoidCallback? onPressed,
    required IconData icon,
    bool loading = false,
    Color? backgroundColor,
    Color? foregroundColor,
    double size = 56.0,
  }) =>
      DefaultIconButton._(
        key: key,
        onPressed: onPressed,
        icon: icon,
        loading: loading,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        size: size,
        type: IconButtonType.outlined,
      );

  factory DefaultIconButton.solid({
    Key? key,
    VoidCallback? onPressed,
    required IconData icon,
    bool loading = false,
    Color? backgroundColor,
    Color? foregroundColor,
    double size = 56.0,
  }) =>
      DefaultIconButton._(
        key: key,
        onPressed: onPressed,
        icon: icon,
        loading: loading,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        size: size,
        type: IconButtonType.solid,
      );

  final VoidCallback? onPressed;
  final IconData icon;
  final bool loading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconButtonType type;
  final double size;

  bool get disabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: switch (type) {
            IconButtonType.solid => backgroundColor ?? PrimaryColors.brand,
            IconButtonType.outlined => Colors.transparent,
          },
          border: switch (type) {
            IconButtonType.solid => null,
            IconButtonType.outlined => Border.all(
                color: foregroundColor ?? PrimaryColors.brand,
              ),
          },
        ),
        height: size,
        width: size,
        child: Icon(
          icon,
          color: foregroundColor ??
              switch (type) {
                IconButtonType.solid => Colors.white,
                IconButtonType.outlined => PrimaryColors.brand
              },
        ),
      ),
    );
  }
}

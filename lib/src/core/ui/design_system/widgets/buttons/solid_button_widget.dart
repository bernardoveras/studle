import 'package:flutter/material.dart';

import '../../colors/base_color.dart';
import '../../design_system.dart';

enum SolidButtonStyle { solid, inverted }

class SolidButton extends StatelessWidget {
  final String label;
  final BaseColor backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;
  final bool loading;
  final double? width;
  final double height;
  final IconData? icon;
  final double iconSize;
  final bool disabled;
  final double radius;
  final SolidButtonStyle style;

  bool get _hasIcon => icon != null;

  const SolidButton._({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onPressed,
    this.loading = false,
    this.width,
    double? height,
    this.icon,
    double? iconSize,
    this.disabled = false,
    double? radius,
    SolidButtonStyle? style,
  })  : height = height ?? 60,
        iconSize = iconSize ?? 32,
        radius = radius ?? 8,
        style = style ?? SolidButtonStyle.solid;

  factory SolidButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    double? width,
    double? height,
    IconData? icon,
    double? iconSize,
    bool disabled = false,
    double? radius,
    SolidButtonStyle? style,
  }) {
    return SolidButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      backgroundColor: PrimaryColors.brand,
      foregroundColor: MonoChromaticColors.white,
      icon: icon,
      iconSize: iconSize,
      disabled: disabled,
      radius: radius,
      style: style,
    );
  }

  factory SolidButton.negative({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    double? width,
    double? height,
    IconData? icon,
    double? iconSize,
    bool disabled = false,
    double? radius,
    SolidButtonStyle? style,
  }) {
    return SolidButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      backgroundColor: SemanticColors.negative,
      foregroundColor: MonoChromaticColors.white,
      icon: icon,
      iconSize: iconSize,
      disabled: disabled,
      radius: radius,
      style: style,
    );
  }

  factory SolidButton.positive({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    double? width,
    double? height,
    IconData? icon,
    double? iconSize,
    bool disabled = false,
    double? radius,
    SolidButtonStyle? style,
  }) {
    return SolidButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      backgroundColor: SemanticColors.positive,
      foregroundColor: MonoChromaticColors.white,
      icon: icon,
      iconSize: iconSize,
      disabled: disabled,
      radius: radius,
      style: style,
    );
  }

  factory SolidButton.light({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    double? width,
    double? height,
    IconData? icon,
    double? iconSize,
    bool disabled = false,
    double? radius,
    SolidButtonStyle? style,
  }) {
    return SolidButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      backgroundColor: MonoChromaticColors.light,
      foregroundColor: MonoChromaticColors.dark.v300,
      icon: icon,
      iconSize: iconSize,
      disabled: disabled,
      radius: radius,
      style: style,
    );
  }

  factory SolidButton.transparent({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    double? width,
    double? height,
    IconData? icon,
    double? iconSize,
    bool disabled = false,
    double? radius,
    SolidButtonStyle? style,
  }) {
    return SolidButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      backgroundColor: MonoChromaticColors.light,
      foregroundColor: MonoChromaticColors.dark.v300,
      icon: icon,
      iconSize: iconSize,
      disabled: disabled,
      radius: radius,
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FilledButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return MonoChromaticColors.light.v500;
            }

            if (style == SolidButtonStyle.inverted) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor;
              }

              if (states.contains(MaterialState.focused)) {
                return backgroundColor.v300;
              }

              return backgroundColor.v200;
            }

            return backgroundColor;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return MonoChromaticColors.dark.v200;
            }

            if (style == SolidButtonStyle.inverted) {
              if (states.contains(MaterialState.pressed)) {
                return MonoChromaticColors.white;
              }

              return backgroundColor.v600;
            }

            return foregroundColor;
          }),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        child: loading
            ? Center(child: ButtonSpinner())
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(),
                    ),
                  ),
                  if (_hasIcon) ...[
                    Icon(
                      icon,
                      size: iconSize,
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

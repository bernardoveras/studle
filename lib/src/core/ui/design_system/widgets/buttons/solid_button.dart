import 'package:flutter/material.dart';

import '../../design_system.dart';

enum SolidButtonStyle {
  solid,
  inverted,
  outlined,
}

class SolidButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
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
        iconSize = iconSize ?? 28,
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
      backgroundColor: MonoChromaticColors.gray.v300,
      foregroundColor: MonoChromaticColors.gray.v900,
      icon: icon,
      iconSize: iconSize,
      disabled: disabled,
      radius: radius,
      style: style,
    );
  }

  factory SolidButton.outlined({
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
  }) {
    return SolidButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      backgroundColor: MonoChromaticColors.gray.v300,
      foregroundColor: MonoChromaticColors.gray.v900,
      icon: icon,
      iconSize: iconSize,
      disabled: disabled,
      radius: radius,
      style: SolidButtonStyle.outlined,
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
    Color? foregroundColor,
    SolidButtonStyle? style,
  }) {
    return SolidButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      backgroundColor: MonoChromaticColors.transparent,
      foregroundColor: foregroundColor ?? MonoChromaticColors.gray.v800,
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
              side: style == SolidButtonStyle.outlined
                  ? BorderSide(
                      color: backgroundColor,
                      width: 1.5,
                    )
                  : BorderSide.none,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return MonoChromaticColors.gray.v300;
            }

            if (style == SolidButtonStyle.inverted) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor;
              }

              if (states.contains(MaterialState.focused)) {
                // return backgroundColor.v300;
                return backgroundColor;
              }

              // return backgroundColor.v200;
              return backgroundColor;
            }

            if (style == SolidButtonStyle.outlined) {
              return Colors.transparent;
            }

            return backgroundColor;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return MonoChromaticColors.gray;
            }

            if (style == SolidButtonStyle.inverted) {
              if (states.contains(MaterialState.pressed)) {
                return MonoChromaticColors.white;
              }

              // return foregroundColor.v600;
              return foregroundColor;
            }

            if (style == SolidButtonStyle.outlined) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor;
              }

              // return foregroundColor.v600;
              return backgroundColor;
            }

            return foregroundColor;
          }),
          textStyle: const MaterialStatePropertyAll(
            Button2Typography(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: loading
            ? Center(child: ButtonSpinner())
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_hasIcon) ...[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        icon,
                        size: iconSize,
                      ),
                    ),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const Button1Typography(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

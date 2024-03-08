import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../design_system/design_system.dart';

enum EmptyStateDisplaySize {
  small(
    iconSize: 60,
    imageSize: 130,
    gap: 24,
  ),
  normal(
    iconSize: 80,
    imageSize: 150,
    gap: 24,
  );

  final double iconSize;
  final double imageSize;
  final double gap;

  const EmptyStateDisplaySize({
    required this.iconSize,
    required this.imageSize,
    required this.gap,
  });
}

class EmptyStateDisplay extends StatelessWidget {
  const EmptyStateDisplay({
    super.key,
    this.icon,
    this.imageSource,
    this.title = 'Oops, tudo limpo!',
    this.description = 'Não encontramos registros no momento.',
    this.primaryButtonText,
    this.onPressedPrimaryButton,
    this.secondaryButtonText,
    this.onPressedSecondaryButton,
    this.size = EmptyStateDisplaySize.normal,
  }) : assert(icon == null || imageSource == null,
            'Only one of icon or imageSource can be provided, not both.');

  final IconData? icon;
  final String? imageSource;
  final String title;
  final String description;
  final String? primaryButtonText;
  final VoidCallback? onPressedPrimaryButton;
  final String? secondaryButtonText;
  final VoidCallback? onPressedSecondaryButton;
  final EmptyStateDisplaySize size;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          curve: Curves.ease,
          duration: 500.ms,
        ),
        ScaleEffect(
          begin: const Offset(0.95, 0.95),
          alignment: Alignment.center,
          curve: Curves.ease,
          duration: 500.ms,
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageSource != null)
            Image.asset(
              imageSource!,
              height: size.imageSize,
            )
          else
            Icon(
              icon,
              size: size.iconSize,
              color: MonoChromaticColors.gray.v400,
            ),
          SizedBox(height: size.gap),
          Text(
            title,
            textAlign: TextAlign.center,
            style: switch (size) {
              EmptyStateDisplaySize.small => Heading3Typography(
                  fontWeight: FontWeight.w600,
                  color: MonoChromaticColors.gray.v900,
                ),
              EmptyStateDisplaySize.normal => Heading2Typography(
                  fontWeight: FontWeight.w600,
                  color: MonoChromaticColors.gray.v900,
                ),
            },
          ),
          SizedBox(height: size.gap),
          Text(
            description,
            textAlign: TextAlign.center,
            style: switch (size) {
              _ => Text2Typography(
                  color: MonoChromaticColors.gray,
                ),
            },
          ),
          if (primaryButtonText != null || secondaryButtonText != null)
            const SizedBox(height: 40),
          if (primaryButtonText != null)
            SolidButton.negative(
              label: primaryButtonText!,
              onPressed: onPressedPrimaryButton,
            ),
          if (secondaryButtonText != null) ...[
            const SizedBox(height: 16),
            SolidButton.outlined(
              label: secondaryButtonText!,
              onPressed: onPressedSecondaryButton,
            ),
          ],
        ],
      ),
    );
  }
}

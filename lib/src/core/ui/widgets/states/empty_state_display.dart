import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../design_system/design_system.dart';

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
  }) : assert(icon == null || imageSource == null,
            'Only one of icon or imageSource can be provided, not both.');

  final Widget? icon;
  final String? imageSource;
  final String title;
  final String description;
  final String? primaryButtonText;
  final VoidCallback? onPressedPrimaryButton;
  final String? secondaryButtonText;
  final VoidCallback? onPressedSecondaryButton;

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
          if (icon != null)
            icon!
          else if (imageSource != null)
            Image.asset(
              imageSource!,
              height: 150,
            )
          else
            Icon(
              PhosphorIconsRegular.notification,
              size: 80,
              color: MonoChromaticColors.gray.v400,
            ),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Heading2Typography(
              fontWeight: FontWeight.w600,
              color: MonoChromaticColors.gray.v900,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Text2Typography(
              color: MonoChromaticColors.gray,
            ),
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

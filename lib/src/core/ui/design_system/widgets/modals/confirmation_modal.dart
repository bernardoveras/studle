import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../design_system.dart';

enum ConfirmationModalStyle { primary, negative, positive }

class ConfirmationModal extends StatelessWidget {
  const ConfirmationModal({
    super.key,
    required this.title,
    required this.description,
    this.confirmationText = 'Confirmar',
    this.cancelText = 'Voltar',
    required this.onConfirmationTap,
    this.style = ConfirmationModalStyle.primary,
  });

  final String title;
  final String description;
  final String confirmationText;
  final VoidCallback onConfirmationTap;
  final String cancelText;
  final ConfirmationModalStyle style;

  @override
  Widget build(BuildContext context) {
    return DefaultModal(
      title: title,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              textAlign: TextAlign.center,
              style: Text2Typography(
                color: MonoChromaticColors.gray,
              ),
            ),
            const SizedBox(height: 32),
            switch (style) {
              ConfirmationModalStyle.primary => SolidButton.primary(
                  label: confirmationText,
                  onPressed: onConfirmationTap,
                ),
              ConfirmationModalStyle.negative => SolidButton.negative(
                  label: confirmationText,
                  onPressed: onConfirmationTap,
                ),
              ConfirmationModalStyle.positive => SolidButton.positive(
                  label: confirmationText,
                  onPressed: onConfirmationTap,
                ),
            },
            const SizedBox(height: 16),
            SolidButton.primary(
              label: cancelText,
              style: SolidButtonStyle.outlined,
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

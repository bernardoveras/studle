import 'package:flutter/material.dart';

import '../design_system.dart';

class DefaultExpansionTile extends StatelessWidget {
  const DefaultExpansionTile({
    super.key,
    required this.title,
    required this.description,
    this.showDivider = true,
    this.textButton,
    this.iconButton,
    this.onPressedButton,
  });

  final String title;
  final String description;
  final bool showDivider;
  final String? textButton;
  final IconData? iconButton;
  final VoidCallback? onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          shape: const Border(),
          iconColor: MonoChromaticColors.gray,
          textColor: MonoChromaticColors.gray.v800,
          collapsedTextColor: MonoChromaticColors.gray.v800,
          collapsedIconColor: MonoChromaticColors.gray,
          title: Text(
            title,
            style: const Text2Typography(
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      description,
                      style: Text2Typography(
                        color: MonoChromaticColors.gray,
                      ),
                    ),
                    if (textButton != null) ...[
                      const SizedBox(height: 24),
                      SolidButton.primary(
                        label: textButton!,
                        icon: iconButton,
                        onPressed: onPressedButton,
                        style: SolidButtonStyle.outlined,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
        if (showDivider)
          Container(
            height: 1.5,
            color: MonoChromaticColors.gray.v200,
          )
      ],
    );
  }
}

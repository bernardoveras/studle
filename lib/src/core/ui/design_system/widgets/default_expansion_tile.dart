import 'package:flutter/material.dart';

import '../design_system.dart';

class DefaultExpansionTile extends StatelessWidget {
  const DefaultExpansionTile({
    super.key,
    required this.title,
    required this.description,
    this.showDivider = true,
  });

  final String title;
  final String description;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          shape: const Border(),
          textColor: PrimaryColors.brand.v700,
          collapsedTextColor: MonoChromaticColors.gray.v800,
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
                child: Text(
                  description,
                  style: Text2Typography(color: MonoChromaticColors.gray),
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

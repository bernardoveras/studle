import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/colors/colors.dart';
import '../../../../core/ui/design_system/typographies/typographies.dart';

class PersonInformationCard extends StatelessWidget {
  const PersonInformationCard({
    super.key,
    required this.name,
    this.description,
    this.pictureUrl,
    this.icon,
    this.showAvatar = true,
  });

  final String name;
  final String? description;
  final String? pictureUrl;
  final IconData? icon;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MonoChromaticColors.gray.v100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showAvatar) ...[
            SizedBox.square(
              dimension: 48,
              child: CircleAvatar(
                backgroundColor: MonoChromaticColors.gray.v300,
                backgroundImage:
                    pictureUrl == null ? null : NetworkImage(pictureUrl!),
                child: pictureUrl != null
                    ? null
                    : Text(
                        name[0],
                        style: Text1Typography(color: PrimaryColors.brand),
                      ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const Text2Typography(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: Text2Typography(
                      fontWeight: FontWeight.w500,
                      color: MonoChromaticColors.gray,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: 12),
            Icon(
              icon,
              color: MonoChromaticColors.gray,
            ),
          ],
        ],
      ),
    );
  }
}

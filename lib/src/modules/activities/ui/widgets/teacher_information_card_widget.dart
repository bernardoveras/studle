import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/ui/design_system/colors/colors.dart';
import '../../../../core/ui/design_system/typographies/typographies.dart';
import '../../../../core/ui/services/snackbar/snackbar_service.dart';
import '../../../../core/utils/copy_text.dart';

class TeacherInformationCard extends StatelessWidget {
  const TeacherInformationCard({
    super.key,
    required this.email,
    required this.name,
    this.pictureUrl,
  });

  final String name;
  final String email;
  final String? pictureUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        copyText(email);
        SnackBarService.show(
          context,
          text: 'E-mail copiado com sucesso.',
          type: SnackBarType.success,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MonoChromaticColors.gray.v100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: Text2Typography(
                      fontWeight: FontWeight.w500,
                      color: MonoChromaticColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              PhosphorIconsRegular.copy,
              color: MonoChromaticColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}

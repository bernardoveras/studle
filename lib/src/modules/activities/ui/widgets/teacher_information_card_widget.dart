import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/ui/services/snackbar/snackbar_service.dart';
import '../../../../core/ui/widgets/cards/person_information_card.dart';
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
      child: PersonInformationCard(
        name: name,
        description: email,
        pictureUrl: pictureUrl,
        icon: PhosphorIconsRegular.copy,
      ),
    );
  }
}

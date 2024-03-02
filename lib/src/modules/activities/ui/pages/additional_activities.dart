import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';

class AdditionalActivities extends StatelessWidget {
  const AdditionalActivities({super.key});

  static String get route => '/activities';

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Atividades complementares',
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: bottomPadding + 16,
        ),
        child: SolidButton.primary(
          label: 'Link para envio de atividades',
          icon: PhosphorIconsRegular.arrowSquareOut,
          style: SolidButtonStyle.outlined,
          onPressed: () {},
        ),
      ),
    );
  }
}

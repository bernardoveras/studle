import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/utils/redirect_to_url.dart';
import '../parameters/campaign_page_parameters.dart';
import '../widgets/campaign_header.dart';

class CampaignPage extends StatelessWidget {
  const CampaignPage({
    super.key,
    required this.parameters,
  });

  final CampaignPageParameters parameters;

  static String get route => '/campaign';

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      bottomSheet: parameters.link == null
          ? null
          : Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: bottomPadding + 16,
              ),
              child: Animate(
                delay: 500.ms,
                effects: const [FadeEffect(curve: Curves.ease)],
                child: SolidButton.primary(
                  label: 'Link',
                  icon: PhosphorIconsRegular.arrowSquareOut,
                  style: SolidButtonStyle.outlined,
                  onPressed: () => redirectToUrl(parameters.link!),
                ),
              ),
            ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CampaignHeader(
            bannerUrl: parameters.bannerUrl,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16 + bottomPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Animate(
                    delay: 100.ms,
                    effects: [
                      FadeEffect(
                        curve: Curves.ease,
                        duration: 500.ms,
                      ),
                      ScaleEffect(
                        begin: const Offset(0.7, 0),
                        alignment: Alignment.topLeft,
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: 400.ms,
                      ),
                    ],
                    child: Text(
                      parameters.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MonoChromaticColors.dark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Animate(
                    delay: 200.ms,
                    effects: [
                      FadeEffect(
                        curve: Curves.ease,
                        duration: 500.ms,
                      ),
                      ScaleEffect(
                        begin: const Offset(0.7, 0),
                        alignment: Alignment.topLeft,
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: 400.ms,
                      ),
                    ],
                    child: Text(
                      parameters.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: MonoChromaticColors.dark.v300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

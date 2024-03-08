import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/utils/redirect_to_url.dart';
import '../parameters/campaign_page_parameter.dart';
import '../widgets/campaign_header.dart';

class CampaignPage extends StatelessWidget {
  const CampaignPage({
    super.key,
    required this.parameters,
  });

  final CampaignPageParameter parameters;

  static String get route => '/campaign';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: parameters.link == null
          ? null
          : Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16 + context.bottomPadding,
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
                bottom: 16 + context.bottomPadding,
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
                      style: Heading3Typography(
                        fontWeight: FontWeight.bold,
                        color: MonoChromaticColors.gray.v800,
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
                      style: Text2Typography(
                        color: MonoChromaticColors.gray.v600,
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

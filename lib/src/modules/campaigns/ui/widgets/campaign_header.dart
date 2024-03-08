import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/ui/design_system/design_system.dart';

class CampaignHeader extends StatelessWidget {
  final String? bannerUrl;

  const CampaignHeader({
    super.key,
    this.bannerUrl,
  });

  @override
  Widget build(BuildContext context) {
    var topPadding = context.topPadding;
    var screenSize = context.screenSize;

    return Container(
      decoration: BoxDecoration(
        color: MonoChromaticColors.white,
        border: bannerUrl == null
            ? Border(
                bottom: BorderSide(
                  color: MonoChromaticColors.gray.v200,
                  width: 2,
                ),
              )
            : null,
      ),
      width: screenSize.width,
      height: screenSize.height * (bannerUrl == null ? 0.14 : 0.2),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          if (bannerUrl != null)
            SizedBox(
              width: screenSize.width,
              child: Image.network(
                bannerUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : Padding(
                            padding: EdgeInsets.only(
                              top: topPadding,
                            ),
                            child: Center(
                              child: ButtonSpinner(
                                color: PrimaryColors.brand,
                              ),
                            ),
                          ),
              ),
            ),
          Positioned(
            top: topPadding,
            left: 16,
            child: Animate(
              delay: 200.ms,
              effects: const [
                FadeEffect(curve: Curves.ease),
                MoveEffect(
                  curve: Curves.ease,
                ),
              ],
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bannerUrl == null
                        ? MonoChromaticColors.gray.v200
                        : Colors.white,
                  ),
                  height: 40,
                  width: 40,
                  child: Icon(
                    PhosphorIconsBold.x,
                    color: bannerUrl == null
                        ? MonoChromaticColors.gray.v700
                        : MonoChromaticColors.gray,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

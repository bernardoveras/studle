import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../../authentication/ui/pages/login_page.dart';
import '../stores/onboarding_store.dart';

class OnboardingBottomSheet extends StatelessWidget {
  const OnboardingBottomSheet({
    super.key,
    required this.store,
  });

  final OnboardingStore store;

  void next(BuildContext context) {
    final result = store.next();

    if (result == null) {
      return context.go(LoginPage.route);
    }
  }

  void previous() => store.previous();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Animate(
          target: store.isFirstOnboarding ? 0 : 1,
          effects: const [
            FadeEffect(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 300),
            ),
          ],
          child: GestureDetector(
            onTap: previous,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: PrimaryColors.brand,
                ),
              ),
              height: 56,
              width: 56,
              child: Icon(
                PhosphorIconsRegular.arrowLeft,
                color: PrimaryColors.brand,
              ),
            ),
          ),
        ),
        const Spacer(),
        SmoothPageIndicator(
          controller: store.pageController,
          count: store.onboardingCount,
          effect: JumpingDotEffect(
            dotColor: PrimaryColors.brand.v100,
            activeDotColor: PrimaryColors.brand,
            dotHeight: 8,
            dotWidth: 8,
            jumpScale: 2,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => next(context),
          child: Container(
            decoration: BoxDecoration(
              color: PrimaryColors.brand,
              shape: BoxShape.circle,
            ),
            height: 56,
            width: 56,
            child: const Icon(
              PhosphorIconsRegular.arrowRight,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

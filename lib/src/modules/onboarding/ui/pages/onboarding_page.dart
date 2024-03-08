import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../stores/onboarding_store.dart';
import '../widgets/onboarding_bottom_sheet.dart';
import '../widgets/onboarding_step.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static String get route => '/onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final OnboardingStore store;

  @override
  void initState() {
    super.initState();

    store = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (_, __) {
        return Scaffold(
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Animate(
                effects: const [
                  FadeEffect(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 300),
                  ),
                ],
                child: OnboardingBottomSheet(
                  store: store,
                ),
              ),
            ),
          ],
          body: PageView.builder(
            itemCount: store.onboardingCount,
            controller: store.pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final onboarding = store.onboardings[index];

              return OnboardingStep(onboarding: onboarding);
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../domain/entities/onboarding_entity.dart';

class OnboardingStep extends StatelessWidget {
  const OnboardingStep({
    super.key,
    required this.onboarding,
  });

  final OnboardingEntity onboarding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              onboarding.imageSource,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboarding.title,
                  textAlign: TextAlign.left,
                  style: Heading2Typography(
                    color: MonoChromaticColors.gray.v900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  onboarding.description,
                  textAlign: TextAlign.left,
                  style: Text2Typography(
                    color: MonoChromaticColors.gray.v600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

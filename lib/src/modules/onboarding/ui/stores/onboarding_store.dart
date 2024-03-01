import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/image_source_constants.dart';
import '../../domain/entities/onboarding_entity.dart';

class OnboardingStore extends ChangeNotifier {
  OnboardingStore() {
    _composeOnboarding();
  }

  final pageController = PageController();

  OnboardingEntity? currentOnboarding;
  void changeCurrentOnboarding(OnboardingEntity value) {
    currentOnboarding = value;
    notifyListeners();
  }

  late final List<OnboardingEntity> onboardings;

  int get onboardingCount => onboardings.length;
  bool get isFirstOnboarding => currentOnboarding?.order == 0;

  void _composeOnboarding() {
    final onboarding1 = currentOnboarding = OnboardingEntity(
      order: 0,
      imageSource: ImageSourceConstants.onboarding1,
      title: 'Boas-vindas ao App do Aluno!',
      description:
          'Nossa plataforma foi projetada para simplificar e melhorar sua experiência universitária.',
    );

    final onboarding2 = OnboardingEntity(
      order: 1,
      imageSource: ImageSourceConstants.onboarding2,
      title: 'A sua escola no seu bolso.',
      description:
          'Acesse os horários e locais das aulas, suas notas, faltas e outras informações relevantes para cada disciplina de maneira fácil e rápida.',
    );

    final onboarding3 = OnboardingEntity(
      order: 2,
      imageSource: ImageSourceConstants.onboarding3,
      title: 'Mantenha-se conectado(a)!',
      description:
          'Explore o aplicativo e aproveite ao máximo a sua jornada universitária.',
    );

    onboardings = [
      onboarding1,
      onboarding2,
      onboarding3,
    ];
  }

  OnboardingEntity? findOnboardingByOrder(int order) =>
      onboardings.firstWhereOrNull((x) => x.order == order);

  OnboardingEntity? next() {
    if (currentOnboarding == null) return null;

    final nextOrder = currentOnboarding!.order + 1;
    final nextOnboarding = findOnboardingByOrder(nextOrder);

    if (nextOnboarding == null) return null;

    changeCurrentOnboarding(nextOnboarding);
    pageController.animateToPage(
      nextOnboarding.order,
      duration: const Duration(milliseconds: 350),
      curve: Curves.ease,
    );
    return nextOnboarding;
  }

  OnboardingEntity? previous() {
    if (currentOnboarding == null) return null;

    final previousOrder = currentOnboarding!.order - 1;
    final previousOnboarding = findOnboardingByOrder(previousOrder);

    if (previousOnboarding == null) return null;

    changeCurrentOnboarding(previousOnboarding);
    pageController.animateToPage(
      previousOnboarding.order,
      duration: const Duration(milliseconds: 350),
      curve: Curves.ease,
    );
    return previousOnboarding;
  }

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }
}

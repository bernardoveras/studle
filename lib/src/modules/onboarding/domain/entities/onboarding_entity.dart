import 'package:equatable/equatable.dart';

class OnboardingEntity extends Equatable {
  final int order;
  final String imageSource;
  final String title;
  final String description;

  const OnboardingEntity({
    required this.order,
    required this.imageSource,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [
        order,
        imageSource,
        title,
        description,
      ];
}

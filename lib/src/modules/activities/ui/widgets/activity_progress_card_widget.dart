import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/cards/progress_card.dart';

class ActivityProgressCard extends StatelessWidget {
  const ActivityProgressCard({
    super.key,
    required this.totalHours,
    required this.currentHours,
  });

  final int totalHours;
  final int currentHours;
  int get progress => ((currentHours / totalHours) * 100).toInt();

  @override
  Widget build(BuildContext context) {
    return ProgressCard(
      totalProgress: totalHours.toDouble(),
      currentProgress: currentHours.toDouble(),
      title: '$progress% completo',
      description: '$currentHours de $totalHours horas',
    );
  }
}

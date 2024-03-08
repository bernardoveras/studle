import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/colors/colors.dart';
import '../../../../core/ui/design_system/typographies/typographies.dart';

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
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MonoChromaticColors.gray.v100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '$progress% completo',
                  style: const Text2Typography(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  '$currentHours de $totalHours horas',
                  textAlign: TextAlign.end,
                  style: Text2Typography(
                    fontWeight: FontWeight.w500,
                    color: MonoChromaticColors.gray,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: MonoChromaticColors.gray.v300,
            borderRadius: BorderRadius.circular(9999),
          ),
        ],
      ),
    );
  }
}

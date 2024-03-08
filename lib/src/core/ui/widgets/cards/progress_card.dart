import 'package:flutter/material.dart';

import '../../design_system/design_system.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
    this.title,
    this.description,
    required this.totalProgress,
    required this.currentProgress,
  });

  final String? title;
  final String? description;
  final double totalProgress;
  final double currentProgress;

  int get progress => ((currentProgress / totalProgress) * 100).toInt();

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
          if (title != null || description != null) ...[
            Row(
              children: [
                if (title != null)
                  Expanded(
                    child: Text(
                      title!,
                      style: const Text2Typography(fontWeight: FontWeight.bold),
                    ),
                  ),
                if (description != null)
                  Expanded(
                    child: Text(
                      description!,
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
          ],
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

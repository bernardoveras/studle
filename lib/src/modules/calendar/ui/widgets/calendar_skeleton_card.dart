import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/design_system/widgets/skeletons/skeleton_container.dart';

class CalendarSkeletonCard extends StatelessWidget {
  const CalendarSkeletonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SkeletonContainer(
          height: 18,
          width: context.maxWidth * 0.3,
          baseColor: MonoChromaticColors.gray.v300.withOpacity(0.8),
          highlightColor: MonoChromaticColors.gray.v400.withOpacity(0.4),
        ),
        const SizedBox(height: 8),
        SkeletonContainer(
          height: 18,
          width: context.maxWidth,
          baseColor: MonoChromaticColors.gray.v300.withOpacity(0.8),
          highlightColor: MonoChromaticColors.gray.v400.withOpacity(0.4),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SkeletonContainer(
              height: 16,
              width: 90,
              baseColor: MonoChromaticColors.gray.v300.withOpacity(0.8),
              highlightColor: MonoChromaticColors.gray.v400.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: SkeletonContainer(
                height: 4,
                width: 4,
                baseColor: MonoChromaticColors.gray.v300.withOpacity(0.8),
                highlightColor: MonoChromaticColors.gray.v400.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
            SkeletonContainer(
              height: 16,
              width: 50,
              baseColor: MonoChromaticColors.gray.v300.withOpacity(0.8),
              highlightColor: MonoChromaticColors.gray.v400.withOpacity(0.4),
            ),
          ],
        ),
      ],
    );
  }
}

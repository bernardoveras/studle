import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/design_system/widgets/skeletons/skeleton_container.dart';

class NotificationSkeletonCard extends StatelessWidget {
  const NotificationSkeletonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Badge(
                      backgroundColor: MonoChromaticColors.skeleton,
                    ),
                    const SizedBox(width: 8),
                    SkeletonContainer(
                      height: 18,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SkeletonContainer(
                  height: 18,
                  width: MediaQuery.sizeOf(context).width,
                ),
                const SizedBox(height: 4),
                SkeletonContainer(
                  height: 18,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                ),
                const SizedBox(height: 12),
                SkeletonContainer(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          const SkeletonContainer(
            height: 16,
            width: 16,
          ),
        ],
      ),
    );
  }
}

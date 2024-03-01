import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/design_system.dart';

class NotificationTabBar extends StatelessWidget {
  const NotificationTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MonoChromaticColors.gray.v100,
            width: 1.5,
          ),
        ),
      ),
      height: 64,
      width: double.infinity,
      child: TabBar(
        indicatorColor: PrimaryColors.brand,
        indicatorSize: TabBarIndicatorSize.label,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.only(left: 16, right: 8),
        isScrollable: true,
        labelStyle: Button2Typography(
          fontWeight: FontWeight.w500,
          color: PrimaryColors.brand,
        ),
        unselectedLabelStyle: Button2Typography(
          fontWeight: FontWeight.w500,
          color: MonoChromaticColors.gray,
        ),
        splashFactory: NoSplash.splashFactory,
        tabs: [
          const Tab(
            text: 'Todas',
          ),
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Não lidas',
                ),
                const SizedBox(width: 4),
                Badge(
                  label: const Text('3'),
                  textStyle: const Button3Typography(
                    fontWeight: FontWeight.w500,
                  ),
                  backgroundColor: SemanticColors.negative,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/ui/design_system/design_system.dart';

class NotificationTabBar extends StatelessWidget {
  const NotificationTabBar({
    super.key,
    this.onChanged,
    required this.unreadCount,
    this.disabled = false,
  });

  final ValueChanged<int>? onChanged;
  final int unreadCount;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: disabled ? 0.25 : 1,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
      child: IgnorePointer(
        ignoring: disabled,
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: MonoChromaticColors.gray.v100,
                width: 1.5,
              ),
            ),
          ),
          child: TabBar(
            isScrollable: true,
            indicatorColor: PrimaryColors.brand,
            indicatorSize: TabBarIndicatorSize.label,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            labelPadding: const EdgeInsets.only(left: 16, right: 8),
            labelStyle: Button2Typography(
              fontWeight: FontWeight.w500,
              color: PrimaryColors.brand,
            ),
            unselectedLabelStyle: Button2Typography(
              fontWeight: FontWeight.w500,
              color: MonoChromaticColors.gray,
            ),
            onTap: onChanged,
            tabs: [
              const Tab(text: 'Todas'),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Não lidas',
                    ),
                    if (unreadCount > 0) ...[
                      const SizedBox(width: 8),
                      Animate(
                        effects: [
                          FadeEffect(
                            curve: Curves.ease,
                            duration: 300.ms,
                          ),
                          ScaleEffect(
                            begin: const Offset(0.5, 0.5),
                            alignment: Alignment.center,
                            curve: Curves.ease,
                            duration: 300.ms,
                          ),
                        ],
                        child: Badge(
                          label: Text(unreadCount.toString()),
                          textStyle: const Button3Typography(
                            fontWeight: FontWeight.w500,
                          ),
                          backgroundColor: SemanticColors.negative,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

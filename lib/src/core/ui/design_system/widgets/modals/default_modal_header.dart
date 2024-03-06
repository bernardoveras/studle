import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../design_system.dart';

class DefaultModalHeader extends StatelessWidget {
  const DefaultModalHeader({
    super.key,
    this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MonoChromaticColors.gray.v100,
            width: 2,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.square(dimension: 72),
          if (title != null)
            Text(
              title!,
              style: Text1Typography(
                fontWeight: FontWeight.w600,
                color: MonoChromaticColors.gray.v900,
              ),
            ),
          GestureDetector(
            onTap: () => context.pop(),
            behavior: HitTestBehavior.opaque,
            child: SizedBox.square(
              dimension: 72,
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  PhosphorIconsBold.x,
                  color: MonoChromaticColors.gray,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

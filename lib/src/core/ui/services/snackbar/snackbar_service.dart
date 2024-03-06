import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../design_system/design_system.dart';

enum SnackBarType { info, warning, success, error }

abstract class SnackBarService {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context, {
    required String text,
    bool showCloseButton = true,
    SnackBarType type = SnackBarType.info,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        elevation: 2,
        showCloseIcon: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              switch (type) {
                SnackBarType.info => PhosphorIconsRegular.info,
                SnackBarType.error => PhosphorIconsFill.warningCircle,
                SnackBarType.warning => PhosphorIconsFill.warning,
                SnackBarType.success => PhosphorIconsFill.checkCircle,
              },
              color: switch (type) {
                SnackBarType.info => PrimaryColors.brand,
                SnackBarType.error => SemanticColors.negative,
                SnackBarType.warning => SemanticColors.warning,
                SnackBarType.success => SemanticColors.positive,
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: Button2Typography(
                  color: MonoChromaticColors.gray.v700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (showCloseButton) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).clearSnackBars(),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 0,
                    top: 8,
                    bottom: 8,
                  ),
                  child: Icon(
                    PhosphorIconsRegular.x,
                    color: MonoChromaticColors.gray,
                  ),
                ),
              ),
            ],
          ],
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../design_system.dart';

class DefaultCheckboxTile extends StatelessWidget {
  const DefaultCheckboxTile({
    super.key,
    this.title,
    this.value = false,
    this.onChanged,
  });
  final String? title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChanged?.call(!value),
      child: Row(
        children: [
          DefaultCheckbox(
            value: value,
            onChanged: onChanged,
          ),
          if (title != null) ...[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  title!,
                  style: Text1Typography(
                    color: MonoChromaticColors.gray,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../design_system/design_system.dart';

class DefaultListTileItem {
  final Key? key;
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;

  const DefaultListTileItem({
    this.key,
    required this.title,
    this.icon,
    this.onTap,
  });
}

class DefaultListTile extends StatelessWidget {
  const DefaultListTile({
    super.key,
    required this.items,
    this.backgroundColor,
    this.dividerColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 16,
    ),
  });

  final List<DefaultListTileItem> items;
  final Color? backgroundColor;
  final Color? dividerColor;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.separated(
        itemCount: items.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Container(
          height: 1.5,
          color: dividerColor ?? MonoChromaticColors.gray.v300,
        ),
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            key: item.key,
            visualDensity: VisualDensity.compact,
            contentPadding: contentPadding,
            onTap: item.onTap,
            leading: item.icon == null
                ? null
                : Icon(
                    item.icon,
                    color: PrimaryColors.brand,
                  ),
            trailing: item.onTap == null
                ? null
                : Icon(
                    PhosphorIconsBold.caretRight,
                    color: MonoChromaticColors.gray,
                    size: 20,
                  ),
            minLeadingWidth: 16,
            title: Text(
              item.title,
              style: Text2Typography(
                fontWeight: FontWeight.w600,
                color: MonoChromaticColors.gray.v900,
              ),
            ),
          );
        },
      ),
    );
  }
}

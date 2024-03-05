import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.actions,
    this.bottom,
  });

  final String? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  static double defaultHeight = 64.0;

  @override
  Size get preferredSize =>
      Size.fromHeight(defaultHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      actions: actions,
      bottom: bottom,
    );
  }
}

import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.actions,
    this.shape,
  });

  final String? title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final ShapeBorder? shape;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      actions: actions,
      shape: shape,
      iconTheme: Theme.of(context).appBarTheme.iconTheme?.copyWith(
            color: foregroundColor,
          ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../extensions/build_context_extension.dart';
import 'default_modal_header.dart';

class DefaultModal extends StatelessWidget {
  const DefaultModal({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = context.bottomPadding;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.maxHeight * 0.85,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: 16 + bottomPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultModalHeader(title: title),
            child,
          ],
        ),
      ),
    );
  }
}

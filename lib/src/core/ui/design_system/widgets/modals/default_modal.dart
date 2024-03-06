import 'package:flutter/material.dart';

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
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.85,
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

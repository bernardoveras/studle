import 'package:flutter/services.dart';

Future<void> copyText(String text) {
  return Clipboard.setData(
    ClipboardData(
      text: text,
    ),
  );
}

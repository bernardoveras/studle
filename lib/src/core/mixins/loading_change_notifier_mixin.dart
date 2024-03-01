import 'package:flutter/material.dart';

mixin LoadingChangeNotifierMixin on ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  void changeLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}

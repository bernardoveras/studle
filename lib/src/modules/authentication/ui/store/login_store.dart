import 'package:flutter/material.dart';

import '../../../../core/mixins/loading_change_notifier_mixin.dart';

class LoginStore extends ChangeNotifier with LoadingChangeNotifierMixin {
  String login = '';
  void changeLogin(String value) {
    login = value;
    notifyListeners();
  }

  String password = '';
  void changePassword(String value) {
    password = value;
    notifyListeners();
  }

  bool get formIsValid => login.isNotEmpty && password.isNotEmpty;
}

import 'package:flutter/material.dart';

import '../modules/authentication/domain/entities/user_entity.dart';

final class UserSession extends ChangeNotifier {
  UserSession({
    this.user,
  });

  UserEntity? user;
  void setUser(UserEntity? value) {
    user = value;
    notifyListeners();
  }

  bool get isLogged => user != null;
}

import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../modules/authentication/domain/entities/user_entity.dart';
import 'constants/local_storage_key.dart';
import 'exceptions/exceptions.dart';
import 'services/local_storage/domain/services/i_local_storage_service.dart';

final class UserSession extends ChangeNotifier {
  final ILocalStorageService localStorageService;

  UserSession({
    this.user,
    required this.firstAccess,
    required this.localStorageService,
  });

  bool get isLogged => user != null;

  UserEntity? user;
  void setUser(
    UserEntity? value, {
    bool notify = true,
    bool saveOnLocalStorage = true,
  }) {
    user = value;

    if (notify) notifyListeners();

    if (saveOnLocalStorage) {
      localStorageService
          .write<String>(LocalStorageKey.user, value?.toJson())
          .ignore();
    }
  }

  bool firstAccess = false;
  void setFirstAccess(
    bool value, {
    bool notify = true,
    bool saveOnLocalStorage = true,
  }) {
    firstAccess = value;

    if (notify) notifyListeners();

    if (saveOnLocalStorage) {
      localStorageService.write(LocalStorageKey.firstAccess, value).ignore();
    }
  }

  AsyncResult<bool, GenericException> logout() async {
    setUser(null);

    return const Success(true);
  }
}

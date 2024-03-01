import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/unknow_exception.dart';
import '../../../../core/mixins/loading_change_notifier_mixin.dart';
import '../../domain/dtos/login_with_student_registration_dto.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/services/i_auth_service.dart';

class LoginStore extends ChangeNotifier with LoadingChangeNotifierMixin {
  final IAuthService authService;

  LoginStore({
    required this.authService,
  });

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

  AsyncResult<UserEntity, GenericException> submit() async {
    try {
      changeLoading(true);

      if (!formIsValid) {
        return Failure(UnknowException(message: 'Campos incorretos.'));
      }

      final dto = LoginWithStudentRegistrationDto(
        registration: login,
        password: password,
      );

      final result = await authService.loginWithStudentRegistration(dto);

      if (result.isError()) {
        return Failure(result.exceptionOrNull()!);
      }

      final user = result.getOrNull()!;

      return Success(user);
    } finally {
      changeLoading(false);
    }
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/core/exceptions/invalid_credentials_exception.dart';
import 'package:studle/src/modules/authentication/data/services/auth_mock_service_impl.dart';
import 'package:studle/src/modules/authentication/domain/dtos/login_with_student_registration_dto.dart';
import 'package:studle/src/modules/authentication/domain/services/i_auth_service.dart';

import '../../../../../mocks/login_with_student_registration_mock.dart'
    as login_with_student_registration_dto_mock;

void main() {
  late final IAuthService authService;

  setUpAll(() {
    authService = AuthMockServiceImpl();
  });

  group('Login with Student Registration', () {
    test('Success', () async {
      const dto = login_with_student_registration_dto_mock.dto;

      final result = await authService.loginWithStudentRegistration(dto);

      expect(result.isSuccess(), true);
    });

    test('Error', () async {
      const dto = LoginWithStudentRegistrationDto(
        registration: 'invalid_registration',
        password: 'invalid_password',
      );

      final result = await authService.loginWithStudentRegistration(dto);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<InvalidCredentialsException>());
    });
  });
}

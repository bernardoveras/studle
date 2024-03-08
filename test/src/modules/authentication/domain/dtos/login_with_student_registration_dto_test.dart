import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/modules/authentication/domain/dtos/login_with_student_registration_dto.dart';

import '../../../../../mocks/login_with_student_registration_mock.dart' as mock;

void main() {
  test('LoginWithStudentRegistrationDto - equality', () {
    const dto1 = LoginWithStudentRegistrationDto(
      registration: 'registration',
      password: 'password',
    );

    const dto2 = LoginWithStudentRegistrationDto(
      registration: 'registration',
      password: 'password',
    );

    expect(dto1, dto2);
  });

  test('LoginWithStudentRegistrationDto - to map', () {
    const expectedDto = mock.dto;

    final map = expectedDto.toMap();

    expect(map['login'], expectedDto.registration);
    expect(map['password'], expectedDto.password);
  });

  test('LoginWithStudentRegistrationDto - to json', () {
    const expectedDto = mock.dto;

    final json = expectedDto.toJson();

    final map = jsonDecode(json);

    expect(map['login'], expectedDto.registration);
    expect(map['password'], expectedDto.password);
  });
}

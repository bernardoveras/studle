import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/modules/authentication/domain/dtos/login_with_student_registration_dto.dart';

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
    const dto = LoginWithStudentRegistrationDto(
      registration: 'registration',
      password: 'password',
    );

    final map = dto.toMap();

    expect(map['login'], dto.registration);
    expect(map['password'], dto.password);
  });

  test('LoginWithStudentRegistrationDto - to json', () {
    const dto = LoginWithStudentRegistrationDto(
      registration: 'registration',
      password: 'password',
    );

    final json = dto.toJson();

    final map = jsonDecode(json);

    expect(map['login'], dto.registration);
    expect(map['password'], dto.password);
  });
}

import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginWithStudentRegistrationDto extends Equatable {
  final String registration;
  final String password;

  const LoginWithStudentRegistrationDto({
    required this.registration,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'login': registration,
      'password': password,
    };

    return result;
  }

  String toJson() => json.encode(toMap());

  // coverage:ignore-start
  @override
  List<Object?> get props => [registration, password];
  // coverage:ignore-end
}

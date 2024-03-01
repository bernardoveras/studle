import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String accessToken;
  final String refreshToken;
  final String name;
  final String email;
  final String? picture;
  final String cpf;

  const UserEntity({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required this.name,
    required this.email,
    this.picture,
    required this.cpf,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'id': id,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'name': name,
      'email': email,
      'picture': picture,
      'cpf': cpf,
    };

    return result;
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
      name: map['name'],
      email: map['email'],
      picture: map['picture'],
      cpf: map['cpf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        accessToken,
        refreshToken,
        name,
        email,
        picture,
        cpf,
      ];
}

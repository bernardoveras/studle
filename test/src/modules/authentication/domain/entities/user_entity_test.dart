import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/modules/authentication/domain/entities/user_entity.dart';

import '../../../../../mocks/user_entity_mock.dart' as mock;

void main() {
  test('UserEntity - equality', () {
    const entity1 = UserEntity(
      id: 1,
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      registrationNumber: '00123456',
      cpf: '00000000000',
      pictureUrl: 'https://google.com',
    );

    const entity2 = UserEntity(
      id: 1,
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      registrationNumber: '00123456',
      cpf: '00000000000',
      pictureUrl: 'https://google.com',
    );

    expect(entity1, entity2);
  });

  test('UserEntity - to map', () {
    const expectedEntity = mock.entity;

    final map = expectedEntity.toMap();

    expect(map['id'], expectedEntity.id);
    expect(map['access_token'], expectedEntity.accessToken);
    expect(map['refresh_token'], expectedEntity.refreshToken);
    expect(map['name'], expectedEntity.name);
    expect(map['email'], expectedEntity.email);
    expect(map['registration_number'], expectedEntity.registrationNumber);
    expect(map['cpf'], expectedEntity.cpf);
    expect(map['picture_url'], expectedEntity.pictureUrl);
  });

  test('UserEntity - to json', () {
    const expectedEntity = mock.entity;

    final json = expectedEntity.toJson();

    final map = jsonDecode(json);

    expect(map['id'], expectedEntity.id);
    expect(map['access_token'], expectedEntity.accessToken);
    expect(map['refresh_token'], expectedEntity.refreshToken);
    expect(map['name'], expectedEntity.name);
    expect(map['email'], expectedEntity.email);
    expect(map['registration_number'], expectedEntity.registrationNumber);
    expect(map['cpf'], expectedEntity.cpf);
    expect(map['picture_url'], expectedEntity.pictureUrl);
  });

  test('UserEntity - from map', () {
    const expectedEntity = mock.entity;

    final entity = UserEntity.fromMap(mock.map);

    expect(entity, expectedEntity);
  });

  test('UserEntity - from json', () {
    const expectedEntity = mock.entity;

    final entity = UserEntity.fromJson(mock.json);

    expect(entity, expectedEntity);
  });
}

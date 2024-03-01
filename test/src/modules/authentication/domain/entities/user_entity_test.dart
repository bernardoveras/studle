import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/modules/authentication/domain/entities/user_entity.dart';

void main() {
  const defaultEntity = UserEntity(
    id: 1,
    accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
    refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
    name: 'Bernardo Veras',
    email: 'contato@bernardoveras.com.br',
    cpf: '00000000000',
  );
  test('UserEntity - equality', () {
    const entity1 = UserEntity(
      id: 1,
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      cpf: '00000000000',
    );

    const entity2 = UserEntity(
      id: 1,
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      cpf: '00000000000',
    );

    expect(entity1, entity2);
  });

  test('UserEntity - to map', () {
    const entity = defaultEntity;

    final map = entity.toMap();

    expect(map['id'], entity.id);
    expect(map['access_token'], entity.accessToken);
    expect(map['refresh_token'], entity.refreshToken);
    expect(map['name'], entity.name);
    expect(map['email'], entity.email);
    expect(map['cpf'], entity.cpf);
  });

  test('UserEntity - to json', () {
    const entity = defaultEntity;

    final json = entity.toJson();

    final map = jsonDecode(json);

    expect(map['id'], entity.id);
    expect(map['access_token'], entity.accessToken);
    expect(map['refresh_token'], entity.refreshToken);
    expect(map['name'], entity.name);
    expect(map['email'], entity.email);
    expect(map['cpf'], entity.cpf);
  });

  test('UserEntity - from map', () {
    const expectedEntity = defaultEntity;

    final map = <String, dynamic>{
      'id': 1,
      'access_token': '6aa50a1a77db4163bcf3ee2a2a0115fb',
      'refresh_token': '48b38423c45f4daaab8d7ed782fb8dc8',
      'name': 'Bernardo Veras',
      'email': 'contato@bernardoveras.com.br',
      'cpf': '00000000000',
    };

    final entity = UserEntity.fromMap(map);

    expect(entity, expectedEntity);
  });

  test('UserEntity - from json', () {
    const expectedEntity = defaultEntity;

    final json = jsonEncode({
      'id': 1,
      'access_token': '6aa50a1a77db4163bcf3ee2a2a0115fb',
      'refresh_token': '48b38423c45f4daaab8d7ed782fb8dc8',
      'name': 'Bernardo Veras',
      'email': 'contato@bernardoveras.com.br',
      'cpf': '00000000000',
    });

    final entity = UserEntity.fromJson(json.trim());

    expect(entity, expectedEntity);
  });
}

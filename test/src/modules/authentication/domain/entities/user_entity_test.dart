import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/core/extensions/string_extension.dart';
import 'package:myschool/src/modules/authentication/domain/entities/user_entity.dart';
import 'package:myschool/src/modules/authentication/domain/enums/person_gender_enum.dart';

import '../../../../../mocks/user_entity_mock.dart' as mock;

void main() {
  test('UserEntity - equality', () {
    final entity1 = UserEntity(
      id: 1,
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      registrationNumber: '00123456',
      cpf: '00000000000',
      pictureUrl: 'https://google.com',
      phoneNumber: '99999999999',
      birthday: DateTime(2003, 5, 19),
      gender: PersonGender.masculine,
      addressStreet: 'Rua Brigadeiro Tobias',
      addressNumber: '123',
      addressNeighborhood: 'Centro',
      addressCity: 'São Miguel Arcanjo',
      addressZipCode: '18230000',
      addressState: 'São Paulo',
    );

    final entity2 = UserEntity(
      id: 1,
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      registrationNumber: '00123456',
      cpf: '00000000000',
      pictureUrl: 'https://google.com',
      phoneNumber: '99999999999',
      birthday: DateTime(2003, 5, 19),
      gender: PersonGender.masculine,
      addressStreet: 'Rua Brigadeiro Tobias',
      addressNumber: '123',
      addressNeighborhood: 'Centro',
      addressCity: 'São Miguel Arcanjo',
      addressZipCode: '18230000',
      addressState: 'São Paulo',
    );

    expect(entity1, entity2);
  });

  test('UserEntity - to map', () {
    final expectedEntity = mock.entity;

    final map = expectedEntity.toMap();

    expect(map['id'], expectedEntity.id);
    expect(map['access_token'], expectedEntity.accessToken);
    expect(map['refresh_token'], expectedEntity.refreshToken);
    expect(map['name'], expectedEntity.name);
    expect(map['email'], expectedEntity.email);
    expect(map['registration_number'], expectedEntity.registrationNumber);
    expect(map['cpf'], expectedEntity.cpf.removeSpecialCharacters());
    expect(map['picture_url'], expectedEntity.pictureUrl);
    expect(
      map['phone_number'],
      expectedEntity.phoneNumber.removeSpecialCharacters(),
    );
    expect(map['birthday'], expectedEntity.birthday?.toIso8601String());
    expect(map['gender'], expectedEntity.gender?.index);
    expect(map['address_street'], expectedEntity.addressStreet);
    expect(map['address_number'], expectedEntity.addressNumber);
    expect(map['address_neighborhood'], expectedEntity.addressNeighborhood);
    expect(map['address_city'], expectedEntity.addressCity);
    expect(map['address_zip_code'],
        expectedEntity.addressZipCode.removeSpecialCharacters());
    expect(map['address_state'], expectedEntity.addressState);
  });

  test('UserEntity - to json', () {
    final expectedEntity = mock.entity;

    final json = expectedEntity.toJson();

    final map = jsonDecode(json);

    expect(map['id'], expectedEntity.id);
    expect(map['access_token'], expectedEntity.accessToken);
    expect(map['refresh_token'], expectedEntity.refreshToken);
    expect(map['name'], expectedEntity.name);
    expect(map['email'], expectedEntity.email);
    expect(map['registration_number'], expectedEntity.registrationNumber);
    expect(map['cpf'], expectedEntity.cpf.removeSpecialCharacters());
    expect(map['picture_url'], expectedEntity.pictureUrl);
    expect(map['phone_number'],
        expectedEntity.phoneNumber.removeSpecialCharacters());
    expect(map['birthday'], expectedEntity.birthday?.toIso8601String());
    expect(map['gender'], expectedEntity.gender?.index);
    expect(map['address_street'], expectedEntity.addressStreet);
    expect(map['address_number'], expectedEntity.addressNumber);
    expect(map['address_neighborhood'], expectedEntity.addressNeighborhood);
    expect(map['address_city'], expectedEntity.addressCity);
    expect(map['address_zip_code'],
        expectedEntity.addressZipCode.removeSpecialCharacters());
    expect(map['address_state'], expectedEntity.addressState);
  });

  test('UserEntity - from map', () {
    final expectedEntity = mock.entity;

    final entity = UserEntity.fromMap(mock.map);

    expect(entity, expectedEntity);
  });

  test('UserEntity - from json', () {
    final expectedEntity = mock.entity;

    final entity = UserEntity.fromJson(mock.json);

    expect(entity, expectedEntity);
  });
}

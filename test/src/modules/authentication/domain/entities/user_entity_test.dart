import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/core/extension_types/guid.dart';
import 'package:studle/src/core/extensions/string_extension.dart';
import 'package:studle/src/core/utils/nullable_value.dart';
import 'package:studle/src/modules/authentication/domain/entities/user_entity.dart';
import 'package:studle/src/modules/authentication/domain/enums/person_gender_enum.dart';

import '../../../../../mocks/user_entity_mock.dart' as mock;

void main() {
  test('Equality', () {
    final entity1 = UserEntity(
      id: Guid.empty(),
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
      startYear: '2023',
      validityYear: '2024',
    );

    final entity2 = UserEntity(
      id: Guid.empty(),
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
      startYear: '2023',
      validityYear: '2024',
    );

    expect(entity1, entity2);
  });

  test('To map', () {
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
    expect(map['start_year'], expectedEntity.startYear);
    expect(map['validity_year'], expectedEntity.validityYear);
  });

  test('To JSON', () {
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
    expect(map['start_year'], expectedEntity.startYear);
    expect(map['validity_year'], expectedEntity.validityYear);
  });

  test('From map', () {
    final expectedEntity = mock.entity;

    final entity = UserEntity.fromMap(mock.map);

    expect(entity, expectedEntity);
  });

  test('From JSON', () {
    final expectedEntity = mock.entity;

    final entity = UserEntity.fromJson(mock.json);

    expect(entity, expectedEntity);
  });

  test('First letter name', () {
    const name = 'Bernardo Veras';
    final entity = mock.entity.copyWith(name: name);

    expect(entity.firstLetterName, 'B');
  });

  test('Has picture', () {
    var entity = mock.entity
        .copyWith(pictureUrl: const NullableValue('https://google.com'));

    expect(entity.hasPicture, true);

    entity = mock.entity.copyWith(pictureUrl: const NullableValue(null));

    expect(entity.hasPicture, false);
  });

  group('Copy with', () {
    test('Success changing all fields', () {
      final expectedEntity = UserEntity(
        id: Guid.empty(),
        accessToken: '1aa50a1a77db4163bcf3ee2a2a0115fb',
        refreshToken: '18b38423c45f4daaab8d7ed782fb8dc8',
        name: 'Bernardo Silva',
        email: 'ajuda@bernardoveras.com.br',
        registrationNumber: '12345678',
        cpf: '11111111111',
        pictureUrl: 'https://github.com',
        phoneNumber: '11111111111',
        birthday: DateTime(2005, 5, 19),
        gender: PersonGender.feminine,
        addressStreet: 'Rua Brigadeiro',
        addressNumber: '321',
        addressNeighborhood: 'Vila Nova',
        addressCity: 'São Miguel',
        addressZipCode: '00000000',
        addressState: 'Rio de Janeiro',
        startYear: '2022',
        validityYear: '2023',
      );

      final actualEntity = UserEntity(
        id: Guid.empty(),
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
        startYear: '2023',
        validityYear: '2024',
      );

      final changedEntity = actualEntity.copyWith(
        accessToken: expectedEntity.accessToken,
        refreshToken: expectedEntity.refreshToken,
        name: expectedEntity.name,
        email: expectedEntity.email,
        registrationNumber: expectedEntity.registrationNumber,
        cpf: expectedEntity.cpf,
        pictureUrl: NullableValue(expectedEntity.pictureUrl),
        phoneNumber: expectedEntity.phoneNumber,
        birthday: NullableValue(expectedEntity.birthday),
        gender: NullableValue(expectedEntity.gender),
        addressStreet: expectedEntity.addressStreet,
        addressNumber: expectedEntity.addressNumber,
        addressNeighborhood: expectedEntity.addressNeighborhood,
        addressCity: expectedEntity.addressCity,
        addressZipCode: expectedEntity.addressZipCode,
        addressState: expectedEntity.addressState,
        startYear: expectedEntity.startYear,
        validityYear: expectedEntity.validityYear,
      );

      expect(changedEntity.id, expectedEntity.id);
    });
    test('Success without null values', () {
      final actualEntity = UserEntity(
        id: Guid.empty(),
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
        startYear: '2023',
        validityYear: '2024',
      );

      final expectedEntity = UserEntity(
        id: actualEntity.id,
        accessToken: '1aa50a1a77db4163bcf3ee2a2a0115fb',
        refreshToken: '18b38423c45f4daaab8d7ed782fb8dc8',
        name: 'Bernardo Silva',
        email: 'ajuda@bernardoveras.com.br',
        registrationNumber: '12345678',
        cpf: '11111111111',
        pictureUrl: actualEntity.pictureUrl,
        phoneNumber: '11111111111',
        birthday: actualEntity.birthday,
        gender: actualEntity.gender,
        addressStreet: 'Rua Brigadeiro',
        addressNumber: '321',
        addressNeighborhood: 'Vila Nova',
        addressCity: 'São Miguel',
        addressZipCode: '00000000',
        addressState: 'Rio de Janeiro',
        startYear: '2022',
        validityYear: '2023',
      );

      final changedEntity = actualEntity.copyWith(
        accessToken: expectedEntity.accessToken,
        refreshToken: expectedEntity.refreshToken,
        name: expectedEntity.name,
        email: expectedEntity.email,
        registrationNumber: expectedEntity.registrationNumber,
        cpf: expectedEntity.cpf,
        phoneNumber: expectedEntity.phoneNumber,
        addressStreet: expectedEntity.addressStreet,
        addressNumber: expectedEntity.addressNumber,
        addressNeighborhood: expectedEntity.addressNeighborhood,
        addressCity: expectedEntity.addressCity,
        addressZipCode: expectedEntity.addressZipCode,
        addressState: expectedEntity.addressState,
        startYear: expectedEntity.startYear,
        validityYear: expectedEntity.validityYear,
      );

      expect(changedEntity, expectedEntity);
    });

    test('Success with null values', () {
      final actualEntity = UserEntity(
        id: Guid.empty(),
        accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
        refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
        name: 'Bernardo Veras',
        email: 'contato@bernardoveras.com.br',
        registrationNumber: '00123456',
        cpf: '00000000000',
        pictureUrl: null,
        phoneNumber: '99999999999',
        birthday: null,
        gender: null,
        addressStreet: 'Rua Brigadeiro Tobias',
        addressNumber: '123',
        addressNeighborhood: 'Centro',
        addressCity: 'São Miguel Arcanjo',
        addressZipCode: '18230000',
        addressState: 'São Paulo',
        startYear: '2023',
        validityYear: '2024',
      );

      final expectedEntity = UserEntity(
        id: actualEntity.id,
        accessToken: '1aa50a1a77db4163bcf3ee2a2a0115fb',
        refreshToken: '18b38423c45f4daaab8d7ed782fb8dc8',
        name: 'Bernardo Silva',
        email: 'ajuda@bernardoveras.com.br',
        registrationNumber: '12345678',
        cpf: '11111111111',
        pictureUrl: actualEntity.pictureUrl,
        phoneNumber: '11111111111',
        birthday: actualEntity.birthday,
        gender: actualEntity.gender,
        addressStreet: 'Rua Brigadeiro',
        addressNumber: '321',
        addressNeighborhood: 'Vila Nova',
        addressCity: 'São Miguel',
        addressZipCode: '00000000',
        addressState: 'Rio de Janeiro',
        startYear: '2022',
        validityYear: '2023',
      );

      final changedEntity = actualEntity.copyWith(
        accessToken: expectedEntity.accessToken,
        refreshToken: expectedEntity.refreshToken,
        name: expectedEntity.name,
        email: expectedEntity.email,
        registrationNumber: expectedEntity.registrationNumber,
        cpf: expectedEntity.cpf,
        pictureUrl: const NullableValue(null),
        phoneNumber: expectedEntity.phoneNumber,
        birthday: const NullableValue(null),
        gender: const NullableValue(null),
        addressStreet: expectedEntity.addressStreet,
        addressNumber: expectedEntity.addressNumber,
        addressNeighborhood: expectedEntity.addressNeighborhood,
        addressCity: expectedEntity.addressCity,
        addressZipCode: expectedEntity.addressZipCode,
        addressState: expectedEntity.addressState,
        startYear: expectedEntity.startYear,
        validityYear: expectedEntity.validityYear,
      );

      expect(changedEntity, expectedEntity);
    });
  });
}

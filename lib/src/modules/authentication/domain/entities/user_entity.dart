import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../core/extensions/string_extension.dart';
import '../../../../core/utils/nullable_value.dart';
import '../enums/person_gender_enum.dart';

class UserEntity extends Equatable {
  final int id;
  final String accessToken;
  final String refreshToken;
  final String name;
  final String email;
  final String registrationNumber;
  final String? pictureUrl;
  final String cpf;
  final String phoneNumber;
  final DateTime? birthday;
  final PersonGender? gender;
  final String addressStreet;
  final String addressNumber;
  final String addressNeighborhood;
  final String addressCity;
  final String addressZipCode;
  final String addressState;
  final String startYear;
  final String validityYear;

  String get firstLetterName => name[0];
  bool get hasPicture => pictureUrl != null;

  const UserEntity({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required this.name,
    required this.email,
    required this.registrationNumber,
    this.pictureUrl,
    required this.cpf,
    required this.phoneNumber,
    this.birthday,
    this.gender,
    required this.addressStreet,
    required this.addressNumber,
    required this.addressNeighborhood,
    required this.addressCity,
    required this.addressZipCode,
    required this.addressState,
    required this.startYear,
    required this.validityYear,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'id': id,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'name': name,
      'email': email,
      'registration_number': registrationNumber,
      'picture_url': pictureUrl,
      'cpf': cpf.removeSpecialCharacters(),
      'phone_number': phoneNumber.removeSpecialCharacters(),
      'birthday': birthday?.toIso8601String(),
      'gender': gender?.index,
      'address_street': addressStreet,
      'address_number': addressNumber,
      'address_neighborhood': addressNeighborhood,
      'address_city': addressCity,
      'address_zip_code': addressZipCode.removeSpecialCharacters(),
      'address_state': addressState,
      'start_year': startYear,
      'validity_year': validityYear,
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
      registrationNumber: map['registration_number'],
      pictureUrl: map['picture_url'],
      cpf: map['cpf'],
      phoneNumber: map['phone_number'],
      birthday:
          map['birthday'] == null ? null : DateTime.parse(map['birthday']),
      gender:
          map['gender'] == null ? null : PersonGender.fromInt(map['gender']),
      addressStreet: map['address_street'],
      addressNumber: map['address_number'],
      addressNeighborhood: map['address_neighborhood'],
      addressCity: map['address_city'],
      addressZipCode: map['address_zip_code'],
      addressState: map['address_state'],
      startYear: map['start_year'],
      validityYear: map['validity_year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source));

  UserEntity copyWith({
    int? id,
    String? accessToken,
    String? refreshToken,
    String? name,
    String? email,
    String? registrationNumber,
    NullableValue<String?>? pictureUrl,
    String? cpf,
    String? phoneNumber,
    NullableValue<DateTime?>? birthday,
    NullableValue<PersonGender?>? gender,
    String? addressStreet,
    String? addressNumber,
    String? addressNeighborhood,
    String? addressCity,
    String? addressZipCode,
    String? addressState,
    String? startYear,
    String? validityYear,
  }) {
    return UserEntity(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      name: name ?? this.name,
      email: email ?? this.email,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      pictureUrl: pictureUrl != null ? pictureUrl.value : this.pictureUrl,
      cpf: cpf ?? this.cpf,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthday: birthday != null ? birthday.value : this.birthday,
      gender: gender != null ? gender.value : this.gender,
      addressStreet: addressStreet ?? this.addressStreet,
      addressNumber: addressNumber ?? this.addressNumber,
      addressNeighborhood: addressNeighborhood ?? this.addressNeighborhood,
      addressCity: addressCity ?? this.addressCity,
      addressZipCode: addressZipCode ?? this.addressZipCode,
      addressState: addressState ?? this.addressState,
      startYear: startYear ?? this.startYear,
      validityYear: validityYear ?? this.validityYear,
    );
  }

  @override
  List<Object?> get props => [
        id,
        accessToken,
        refreshToken,
        name,
        email,
        registrationNumber,
        pictureUrl,
        cpf,
        phoneNumber,
        birthday,
        gender,
        addressStreet,
        addressNumber,
        addressNeighborhood,
        addressCity,
        addressZipCode,
        addressState,
        startYear,
        validityYear,
      ];
}

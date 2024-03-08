import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/core/extension_types/guid.dart';
import 'package:myschool/src/core/utils/nullable_value.dart';
import 'package:myschool/src/modules/notifications/domain/entities/notification_entity.dart';
import 'package:myschool/src/modules/notifications/domain/enums/notification_link_type_enum.dart';
import 'package:myschool/src/modules/notifications/domain/enums/notification_status_enum.dart';

import '../../../../../mocks/notification_entity_mock.dart' as mock;

void main() {
  test('NotificationEntity - equality', () {
    final entity1 = NotificationEntity(
      id: Guid.empty(),
      title: '6º Encontro de Clássicos na My School',
      description:
          'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
      status: NotificationStatus.read,
      createdAt: DateTime(2024, 2, 14, 12, 50),
    );

    final entity2 = NotificationEntity(
      id: Guid.empty(),
      title: '6º Encontro de Clássicos na My School',
      description:
          'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
      status: NotificationStatus.read,
      createdAt: DateTime(2024, 2, 14, 12, 50),
    );

    expect(entity1, entity2);
  });

  test('NotificationEntity - equality - with link', () {
    final entity1 = NotificationEntity(
      id: Guid.empty(),
      title: '6º Encontro de Clássicos na My School',
      description:
          'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
      link: 'https://google.com',
      linkType: NotificationLinkType.redirectToSite,
      status: NotificationStatus.read,
      createdAt: DateTime(2024, 2, 14, 12, 50),
    );

    final entity2 = NotificationEntity(
      id: Guid.empty(),
      title: '6º Encontro de Clássicos na My School',
      description:
          'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
      link: 'https://google.com',
      linkType: NotificationLinkType.redirectToSite,
      status: NotificationStatus.read,
      createdAt: DateTime(2024, 2, 14, 12, 50),
    );

    expect(entity1, entity2);
  });

  test('NotificationEntity - to map', () {
    final expectedEntity = mock.entity;

    final map = expectedEntity.toMap();

    expect(map['id'], expectedEntity.id);
    expect(map['title'], expectedEntity.title);
    expect(map['description'], expectedEntity.description);
    expect(map['status'], expectedEntity.status.index);
    expect(map['link'], expectedEntity.link);
    expect(map['link_type'], expectedEntity.linkType?.index);
    expect(map['created_at'], expectedEntity.createdAt.toIso8601String());
  });

  test('NotificationEntity - to map - with link', () {
    final expectedEntity = mock.entityWithLink;

    final map = expectedEntity.toMap();

    expect(map['id'], expectedEntity.id);
    expect(map['title'], expectedEntity.title);
    expect(map['description'], expectedEntity.description);
    expect(map['status'], expectedEntity.status.index);
    expect(map['link'], expectedEntity.link);
    expect(map['link_type'], expectedEntity.linkType?.index);
    expect(map['created_at'], expectedEntity.createdAt.toIso8601String());
  });

  test('NotificationEntity - to json', () {
    final expectedEntity = mock.entity;

    final json = expectedEntity.toJson();

    final map = jsonDecode(json);

    expect(map['id'], expectedEntity.id);
    expect(map['title'], expectedEntity.title);
    expect(map['description'], expectedEntity.description);
    expect(map['status'], expectedEntity.status.index);
    expect(map['link'], expectedEntity.link);
    expect(map['link_type'], expectedEntity.linkType?.index);
    expect(map['created_at'], expectedEntity.createdAt.toIso8601String());
  });

  test('NotificationEntity - to json - with link', () {
    final expectedEntity = mock.entityWithLink;

    final json = expectedEntity.toJson();

    final map = jsonDecode(json);

    expect(map['id'], expectedEntity.id);
    expect(map['title'], expectedEntity.title);
    expect(map['description'], expectedEntity.description);
    expect(map['status'], expectedEntity.status.index);
    expect(map['link'], expectedEntity.link);
    expect(map['link_type'], expectedEntity.linkType?.index);
    expect(map['created_at'], expectedEntity.createdAt.toIso8601String());
  });

  test('NotificationEntity - from map', () {
    final expectedEntity = mock.entity;

    final entity = NotificationEntity.fromMap(mock.map);

    expect(entity, expectedEntity);
  });

  test('NotificationEntity - from map - with link', () {
    final expectedEntity = mock.entityWithLink;

    final entity = NotificationEntity.fromMap(mock.mapWithLink);

    expect(entity, expectedEntity);
  });

  test('NotificationEntity - from json', () {
    final expectedEntity = mock.entity;

    final entity = NotificationEntity.fromJson(mock.json);

    expect(entity, expectedEntity);
  });

  test('NotificationEntity - from json - with link', () {
    final expectedEntity = mock.entityWithLink;

    final entity = NotificationEntity.fromJson(mock.jsonWithLink);

    expect(entity, expectedEntity);
  });

  test('NotificationEntity - copyWith', () {
    final expectedEntity = NotificationEntity(
      id: mock.entityWithLink.id,
      title: 'Changed title',
      description: 'Changed description',
      status: mock.entityWithLink.status,
      link: mock.entityWithLink.link,
      linkType: mock.entityWithLink.linkType,
      createdAt: mock.entityWithLink.createdAt,
    );

    final entity = mock.entityWithLink.copyWith(
      title: 'Changed title',
      description: 'Changed description',
      link: null,
    );

    expect(entity, expectedEntity);
  });

  test('NotificationEntity - copyWith - null values', () {
    final expectedEntity = NotificationEntity(
      id: mock.entityWithLink.id,
      title: mock.entityWithLink.title,
      description: mock.entityWithLink.description,
      status: mock.entityWithLink.status,
      link: null,
      linkType: null,
      createdAt: mock.entityWithLink.createdAt,
    );

    final entity = mock.entityWithLink.copyWith(
      link: const NullableValue(null),
      linkType: const NullableValue(null),
    );

    expect(entity, expectedEntity);
  });
}

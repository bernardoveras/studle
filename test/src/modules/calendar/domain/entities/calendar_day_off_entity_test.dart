import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_day_off_entity.dart';

import '../../../../../mocks/calendar_day_off_entity_mock.dart' as mock;

void main() {
  test('CalendarDayOffEntity - equality', () {
    final entity1 = CalendarDayOffEntity(
      name: 'Feriado (Independência do Brasil)',
      date: DateTime(2024, 9, 7),
    );

    final entity2 = CalendarDayOffEntity(
      name: 'Feriado (Independência do Brasil)',
      date: DateTime(2024, 9, 7),
    );

    expect(entity1, entity2);
  });

  test('CalendarDayOffEntity - to map', () {
    final expectedEntity = mock.entity;

    final map = expectedEntity.toMap();

    expect(map['name'], expectedEntity.name);
    expect(map['date'], expectedEntity.date.toIso8601String());
  });

  test('CalendarDayOffEntity - to json', () {
    final expectedEntity = mock.entity;

    final json = expectedEntity.toJson();

    final map = jsonDecode(json);

    expect(map['name'], expectedEntity.name);
    expect(map['date'], expectedEntity.date.toIso8601String());
  });

  test('CalendarDayOffEntity - from map', () {
    final expectedEntity = mock.entity;

    final entity = CalendarDayOffEntity.fromMap(mock.map);

    expect(entity, expectedEntity);
  });

  test('CalendarDayOffEntity - from json', () {
    final expectedEntity = mock.entity;

    final entity = CalendarDayOffEntity.fromJson(mock.json);

    expect(entity, expectedEntity);
  });
}

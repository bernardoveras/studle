import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_activity_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_day_off_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_entity.dart';

import '../../../../../mocks/calendar_entity_mock.dart' as mock;

void main() {
  test('CalendarEntity - equality', () {
    final entity1 = CalendarEntity(
      activities: [
        CalendarActivityEntity(
          id: 1,
          teacherName: 'Prof. Angela Maria',
          schoolSubjects:
              'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
          location: 'EAD',
          startDate: DateTime(2024, 3, 5, 17, 20),
          endDate: DateTime(2024, 3, 5, 18, 10),
        ),
      ],
      daysOff: [
        CalendarDayOffEntity(
          name: 'Feriado (Independência do Brasil)',
          date: DateTime(2024, 9, 7),
        ),
      ],
    );

    final entity2 = CalendarEntity(
      activities: [
        CalendarActivityEntity(
          id: 1,
          teacherName: 'Prof. Angela Maria',
          schoolSubjects:
              'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
          location: 'EAD',
          startDate: DateTime(2024, 3, 5, 17, 20),
          endDate: DateTime(2024, 3, 5, 18, 10),
        ),
      ],
      daysOff: [
        CalendarDayOffEntity(
          name: 'Feriado (Independência do Brasil)',
          date: DateTime(2024, 9, 7),
        ),
      ],
    );

    expect(entity1, entity2);
  });

  test('CalendarEntity - to map', () {
    final expectedEntity = mock.entity;

    final map = expectedEntity.toMap();

    expect(map['activities'],
        expectedEntity.activities.map((e) => e.toMap()).toList());
    expect(
        map['days_off'], expectedEntity.daysOff.map((e) => e.toMap()).toList());
  });

  test('CalendarEntity - to json', () {
    final expectedEntity = mock.entity;

    final json = expectedEntity.toJson();

    final map = jsonDecode(json);

    expect(
      map['activities'],
      expectedEntity.activities.map((e) => e.toMap()).toList(),
    );
    expect(
      map['days_off'],
      expectedEntity.daysOff.map((e) => e.toMap()).toList(),
    );
  });

  test('CalendarEntity - from map', () {
    final expectedEntity = mock.entity;

    final entity = CalendarEntity.fromMap(mock.map);

    expect(entity, expectedEntity);
  });

  test('CalendarEntity - from json', () {
    final expectedEntity = mock.entity;

    final entity = CalendarEntity.fromJson(mock.json);

    expect(entity, expectedEntity);
  });
}

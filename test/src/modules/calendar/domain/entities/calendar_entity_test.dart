import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/core/extension_types/guid.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_activity_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_day_off_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_entity.dart';

import '../../../../../mocks/calendar_entity_mock.dart' as mock;

void main() {
  test('CalendarEntity - equality', () {
    final entity1 = CalendarEntity(
      activities: [
        CalendarActivityEntity(
          id: Guid.empty(),
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
          id: Guid.empty(),
          name: 'Feriado (Independência do Brasil)',
          startDate: DateTime(2024, 9, 7),
        ),
      ],
      busyDates: [
        DateTime(2024, 3, 5),
        DateTime(2024, 9, 7),
      ],
    );

    final entity2 = CalendarEntity(
      activities: [
        CalendarActivityEntity(
          id: Guid.empty(),
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
          id: Guid.empty(),
          name: 'Feriado (Independência do Brasil)',
          startDate: DateTime(2024, 9, 7),
        ),
      ],
      busyDates: [
        DateTime(2024, 3, 5),
        DateTime(2024, 9, 7),
      ],
    );

    expect(entity1, entity2);
  });

  test('CalendarEntity - to map', () {
    final expectedEntity = mock.entity;

    final map = expectedEntity.toMap();

    expect(
      map['activities'],
      expectedEntity.activities.map((e) => e.toMap()).toList(),
    );
    expect(
      map['days_off'],
      expectedEntity.daysOff.map((e) => e.toMap()).toList(),
    );
    expect(
      map['busy_dates'],
      expectedEntity.busyDates.map((e) => e.toIso8601String()).toList(),
    );
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
    expect(
      map['busy_dates'],
      expectedEntity.busyDates.map((e) => e.toIso8601String()).toList(),
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

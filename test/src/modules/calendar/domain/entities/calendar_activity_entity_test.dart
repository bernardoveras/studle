import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/core/extension_types/guid.dart';
import 'package:studle/src/modules/calendar/domain/entities/calendar_activity_entity.dart';

import '../../../../../mocks/calendar_activity_entity_mock.dart' as mock;

void main() {
  test('CalendarActivityEntity - equality', () {
    final entity1 = CalendarActivityEntity(
      id: Guid.empty(),
      teacherName: 'Prof. Angela Maria',
      schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
      location: 'EAD',
      startDate: DateTime(2024, 3, 5, 17, 20),
      endDate: DateTime(2024, 3, 5, 18, 10),
    );

    final entity2 = CalendarActivityEntity(
      id: Guid.empty(),
      teacherName: 'Prof. Angela Maria',
      schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
      location: 'EAD',
      startDate: DateTime(2024, 3, 5, 17, 20),
      endDate: DateTime(2024, 3, 5, 18, 10),
    );

    expect(entity1, entity2);
  });

  test('CalendarActivityEntity - to map', () {
    final expectedEntity = mock.entity;

    final map = expectedEntity.toMap();

    expect(map['id'], expectedEntity.id);
    expect(map['teacher_name'], expectedEntity.teacherName);
    expect(map['school_subjects'], expectedEntity.schoolSubjects);
    expect(map['location'], expectedEntity.location);
    expect(map['start_date'], expectedEntity.startDate.toIso8601String());
    expect(map['end_date'], expectedEntity.endDate.toIso8601String());
  });

  test('CalendarActivityEntity - to json', () {
    final expectedEntity = mock.entity;

    final json = expectedEntity.toJson();

    final map = jsonDecode(json);

    expect(map['id'], expectedEntity.id);
    expect(map['teacher_name'], expectedEntity.teacherName);
    expect(map['school_subjects'], expectedEntity.schoolSubjects);
    expect(map['location'], expectedEntity.location);
    expect(map['start_date'], expectedEntity.startDate.toIso8601String());
    expect(map['end_date'], expectedEntity.endDate.toIso8601String());
  });

  test('CalendarActivityEntity - from map', () {
    final expectedEntity = mock.entity;

    final entity = CalendarActivityEntity.fromMap(mock.map);

    expect(entity, expectedEntity);
  });

  test('CalendarActivityEntity - from json', () {
    final expectedEntity = mock.entity;

    final entity = CalendarActivityEntity.fromJson(mock.json);

    expect(entity, expectedEntity);
  });
}

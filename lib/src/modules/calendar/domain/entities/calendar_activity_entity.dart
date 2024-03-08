import 'dart:convert';

import 'i_calendar_child.dart';

class CalendarActivityEntity extends ICalendarChild {
  final String teacherName;
  final String schoolSubjects;
  final String location;
  final DateTime endDate;

  const CalendarActivityEntity({
    required super.id,
    required this.teacherName,
    required this.schoolSubjects,
    required this.location,
    required super.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'id': id,
      'teacher_name': teacherName,
      'school_subjects': schoolSubjects,
      'location': location,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
    };

    return result;
  }

  factory CalendarActivityEntity.fromMap(Map<String, dynamic> map) {
    return CalendarActivityEntity(
      id: map['id'],
      teacherName: map['teacher_name'],
      schoolSubjects: map['school_subjects'],
      location: map['location'],
      startDate: DateTime.parse(map['start_date']),
      endDate: DateTime.parse(map['end_date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarActivityEntity.fromJson(String source) =>
      CalendarActivityEntity.fromMap(json.decode(source));

  @override
  List<Object?> get props {
    return [
      ...super.props,
      teacherName,
      schoolSubjects,
      location,
      endDate,
    ];
  }
}

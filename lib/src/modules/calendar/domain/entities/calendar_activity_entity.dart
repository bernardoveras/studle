import 'dart:convert';

import 'package:equatable/equatable.dart';

class CalendarActivityEntity extends Equatable {
  final String teacherName;
  final String schoolSubjects;
  final String location;
  final DateTime startDate;
  final DateTime endDate;

  const CalendarActivityEntity({
    required this.teacherName,
    required this.schoolSubjects,
    required this.location,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
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
      teacherName,
      schoolSubjects,
      location,
      startDate,
      endDate,
    ];
  }
}

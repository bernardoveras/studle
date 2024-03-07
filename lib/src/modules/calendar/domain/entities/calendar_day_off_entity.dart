import 'dart:convert';

import 'package:equatable/equatable.dart';

class CalendarDayOffEntity extends Equatable {
  final String name;
  final DateTime date;

  const CalendarDayOffEntity({
    required this.name,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'name': name,
      'date': date.toIso8601String(),
    };

    return result;
  }

  factory CalendarDayOffEntity.fromMap(Map<String, dynamic> map) {
    return CalendarDayOffEntity(
      name: map['name'],
      date: DateTime.parse(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarDayOffEntity.fromJson(String source) =>
      CalendarDayOffEntity.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        name,
        date,
      ];
}

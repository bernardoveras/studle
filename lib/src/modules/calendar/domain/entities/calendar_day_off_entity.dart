import 'dart:convert';

import 'i_calendar_child.dart';

class CalendarDayOffEntity extends ICalendarChild {
  final String name;

  const CalendarDayOffEntity({
    required super.id,
    required this.name,
    required super.startDate,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'id': id,
      'name': name,
      'date': startDate.toIso8601String(),
    };

    return result;
  }

  factory CalendarDayOffEntity.fromMap(Map<String, dynamic> map) {
    return CalendarDayOffEntity(
      id: map['id'],
      name: map['name'],
      startDate: DateTime.parse(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarDayOffEntity.fromJson(String source) =>
      CalendarDayOffEntity.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        ...super.props,
        name,
      ];
}

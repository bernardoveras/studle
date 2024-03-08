import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'calendar_activity_entity.dart';
import 'calendar_day_off_entity.dart';

class CalendarEntity extends Equatable {
  final List<CalendarActivityEntity> activities;
  final List<CalendarDayOffEntity> daysOff;
  final List<DateTime> busyDates;

  const CalendarEntity({
    required this.activities,
    required this.daysOff,
    required this.busyDates,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'activities': activities.map((x) => x.toMap()).toList(),
      'days_off': daysOff.map((x) => x.toMap()).toList(),
      'busy_dates': busyDates.map((e) => e.toIso8601String()).toList(),
    };

    return result;
  }

  factory CalendarEntity.fromMap(Map<String, dynamic> map) {
    return CalendarEntity(
      activities: (map['activities'] as List)
          .map((x) => CalendarActivityEntity.fromMap(x))
          .toList(),
      daysOff: (map['days_off'] as List)
          .map((x) => CalendarDayOffEntity.fromMap(x))
          .toList(),
      busyDates:
          (map['busy_dates'] as List).map((x) => DateTime.parse(x)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarEntity.fromJson(String source) =>
      CalendarEntity.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        activities,
        daysOff,
        busyDates,
      ];
}

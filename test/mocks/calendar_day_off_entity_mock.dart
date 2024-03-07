import 'package:myschool/src/modules/calendar/domain/entities/calendar_day_off_entity.dart';

final entity = CalendarDayOffEntity(
  name: 'Feriado (Independência do Brasil)',
  date: DateTime(2024, 9, 7),
);

const map = <String, dynamic>{
  'name': 'Feriado (Independência do Brasil)',
  'date': '2024-09-07T00:00:00.000',
};

const json =
    '{"name":"Feriado (Independência do Brasil)","date": "2024-09-07T00:00:00.000"}';

import 'package:studle/src/core/extension_types/guid.dart';
import 'package:studle/src/modules/calendar/domain/entities/calendar_day_off_entity.dart';

final entity = CalendarDayOffEntity(
  id: Guid.empty(),
  name: 'Feriado (Independência do Brasil)',
  startDate: DateTime(2024, 9, 7),
);

final map = <String, dynamic>{
  'id': Guid.empty(),
  'name': 'Feriado (Independência do Brasil)',
  'date': '2024-09-07T00:00:00.000',
};

final json =
    '{"id":"${Guid.empty()}","name":"Feriado (Independência do Brasil)","date": "2024-09-07T00:00:00.000"}';

import 'package:myschool/src/core/extension_types/guid.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_activity_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_day_off_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_entity.dart';

final entity = CalendarEntity(activities: [
  CalendarActivityEntity(
    id: Guid.empty(),
    teacherName: 'Prof. Angela Maria',
    schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
    location: 'EAD',
    startDate: DateTime(2024, 3, 5, 17, 20),
    endDate: DateTime(2024, 3, 5, 18, 10),
  ),
], daysOff: [
  CalendarDayOffEntity(
    id: Guid.empty(),
    name: 'Feriado (Independência do Brasil)',
    startDate: DateTime(2024, 9, 7),
  ),
], busyDates: [
  DateTime(2024, 3, 5),
  DateTime(2024, 9, 7),
]);

final map = <String, dynamic>{
  'activities': [
    {
      'id': Guid.empty(),
      'teacher_name': 'Prof. Angela Maria',
      'school_subjects': 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
      'location': 'EAD',
      'start_date': '2024-03-05T17:20:00.000',
      'end_date': '2024-03-05T18:10:00.000',
    },
  ],
  'days_off': [
    {
      'id': Guid.empty(),
      'name': 'Feriado (Independência do Brasil)',
      'date': '2024-09-07T00:00:00.000',
    },
  ],
  'busy_dates': [
    '2024-03-05T00:00:00.000',
    '2024-09-07T00:00:00.000',
  ],
};

final json =
    '{"activities":[{"id":"${Guid.empty()}","teacher_name": "Prof. Angela Maria","school_subjects": "Pesquisa, Extensão e Inovação: Trabalho de Graduação","location": "EAD","start_date": "2024-03-05T17:20:00.000","end_date": "2024-03-05T18:10:00.000"}],"days_off": [{"id":"${Guid.empty()}","name": "Feriado (Independência do Brasil)","date": "2024-09-07T00:00:00.000"}],"busy_dates":["2024-03-05T00:00:00.000","2024-09-07T00:00:00.000"]}';

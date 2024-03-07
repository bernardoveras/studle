import 'package:myschool/src/modules/calendar/domain/entities/calendar_activity_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_day_off_entity.dart';
import 'package:myschool/src/modules/calendar/domain/entities/calendar_entity.dart';

final entity = CalendarEntity(
  activities: [
    CalendarActivityEntity(
      id: 1,
      teacherName: 'Prof. Angela Maria',
      schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
      location: 'EAD',
      startDate: DateTime(2024, 3, 5, 17, 20),
      endDate: DateTime(2024, 3, 5, 18, 10),
    ),
  ],
  daysOff: [
    CalendarDayOffEntity(
      name: 'Feriado (Independência do Brasil)',
      date: DateTime(2024, 9, 7),
    ),
  ],
);

const map = <String, dynamic>{
  'activities': [
    {
      'id': 1,
      'teacher_name': 'Prof. Angela Maria',
      'school_subjects': 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
      'location': 'EAD',
      'start_date': '2024-03-05T17:20:00.000',
      'end_date': '2024-03-05T18:10:00.000',
    },
  ],
  'days_off': [
    {
      'name': 'Feriado (Independência do Brasil)',
      'date': '2024-09-07T00:00:00.000',
    },
  ],
};

const json =
    '{"activities":[{"id":1,"teacher_name": "Prof. Angela Maria","school_subjects": "Pesquisa, Extensão e Inovação: Trabalho de Graduação","location": "EAD","start_date": "2024-03-05T17:20:00.000","end_date": "2024-03-05T18:10:00.000"}],"days_off": [{"name": "Feriado (Independência do Brasil)","date": "2024-09-07T00:00:00.000"}]}';

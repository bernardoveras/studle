import 'package:myschool/src/modules/calendar/domain/entities/calendar_activity_entity.dart';

final entity = CalendarActivityEntity(
  id: 1,
  teacherName: 'Prof. Angela Maria',
  schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
  location: 'EAD',
  startDate: DateTime(2024, 3, 5, 17, 20),
  endDate: DateTime(2024, 3, 5, 18, 10),
);

const map = <String, dynamic>{
  'id': 1,
  'teacher_name': 'Prof. Angela Maria',
  'school_subjects': 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
  'location': 'EAD',
  'start_date': '2024-03-05T17:20:00.000',
  'end_date': '2024-03-05T18:10:00.000',
};

const json =
    '{"id":1,"teacher_name": "Prof. Angela Maria","school_subjects": "Pesquisa, Extensão e Inovação: Trabalho de Graduação","location": "EAD","start_date": "2024-03-05T17:20:00.000","end_date": "2024-03-05T18:10:00.000"}';

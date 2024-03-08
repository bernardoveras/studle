import 'package:studle/src/core/extension_types/guid.dart';
import 'package:studle/src/modules/calendar/domain/entities/calendar_activity_entity.dart';

final entity = CalendarActivityEntity(
  id: Guid.empty(),
  teacherName: 'Prof. Angela Maria',
  schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
  location: 'EAD',
  startDate: DateTime(2024, 3, 5, 17, 20),
  endDate: DateTime(2024, 3, 5, 18, 10),
);

final map = <String, dynamic>{
  'id': Guid.empty(),
  'teacher_name': 'Prof. Angela Maria',
  'school_subjects': 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
  'location': 'EAD',
  'start_date': '2024-03-05T17:20:00.000',
  'end_date': '2024-03-05T18:10:00.000',
};

final json =
    '{"id":"${Guid.empty()}","teacher_name": "Prof. Angela Maria","school_subjects": "Pesquisa, Extensão e Inovação: Trabalho de Graduação","location": "EAD","start_date": "2024-03-05T17:20:00.000","end_date": "2024-03-05T18:10:00.000"}';

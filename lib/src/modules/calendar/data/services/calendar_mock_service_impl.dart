import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/generic_exception.dart';
import '../../domain/entities/calendar_activity_entity.dart';
import '../../domain/entities/calendar_day_off_entity.dart';
import '../../domain/entities/calendar_entity.dart';
import '../../domain/services/i_calendar_service.dart';

class CalendarMockServiceImpl implements ICalendarService {
  @override
  AsyncResult<CalendarEntity, GenericException> fetch({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    startDate ??= now.copyWith(day: 1);
    endDate ??= DateTime(startDate.year, startDate.month + 1, 0);

    return Success(CalendarEntity(
      activities: [
        CalendarActivityEntity(
          id: 1,
          teacherName: 'Prof. Angela Maria',
          schoolSubjects:
              'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
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
    ));
  }
}

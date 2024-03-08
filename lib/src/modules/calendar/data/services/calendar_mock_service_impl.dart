import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/generic_exception.dart';
import '../../../../core/extension_types/guid.dart';
import '../../../../core/extensions/date_time_extension.dart';
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
    await Future.delayed(const Duration(milliseconds: 500));

    final now = DateTime.now();
    startDate ??= now.copyWith(day: 1);
    endDate ??= DateTime(startDate.year, startDate.month + 1, 0);

    final activities = [
      CalendarActivityEntity(
        id: Guid.random(),
        teacherName: 'Prof. Angela Maria',
        schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
        location: 'EAD',
        startDate: DateTime(2024, 3, 6, 17, 20),
        endDate: DateTime(2024, 3, 6, 18, 10),
      ),
      CalendarActivityEntity(
        id: Guid.random(),
        teacherName: 'Prof. Angela Maria',
        schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
        location: 'EAD',
        startDate: DateTime(2024, 3, 6, 14, 00),
        endDate: DateTime(2024, 3, 6, 15, 30),
      ),
      CalendarActivityEntity(
        id: Guid.random(),
        teacherName: 'Prof. Angela Maria',
        schoolSubjects: 'Pesquisa, Extensão e Inovação: Trabalho de Graduação',
        location: 'EAD',
        startDate: DateTime(2024, 3, 7, 17, 20),
        endDate: DateTime(2024, 3, 7, 18, 10),
      ),
    ];

    final daysOff = [
      CalendarDayOffEntity(
        id: Guid.random(),
        name: 'Feriado (Teste)',
        startDate: DateTime(2024, 3, 7),
      ),
      CalendarDayOffEntity(
        id: Guid.random(),
        name: 'Feriado (Teste 2)',
        startDate: DateTime(2024, 3, 7),
      ),
      CalendarDayOffEntity(
        id: Guid.random(),
        name: 'Feriado (Teste 3)',
        startDate: DateTime(2024, 3, 8),
      ),
    ];

    final busyDates = [
      ...activities.map((x) => x.startDate.dateOnly),
      ...daysOff.map((x) => x.startDate.dateOnly),
    ].where((x) => x.month == startDate!.month).toList();

    final result = CalendarEntity(
      activities: activities
          .where((x) =>
              x.startDate.isAfter(startDate!) && x.startDate.isBefore(endDate!))
          .toList(),
      daysOff: daysOff
          .where((x) =>
              x.startDate.isAfter(startDate!) && x.startDate.isBefore(endDate!))
          .toList(),
      busyDates: busyDates,
    );

    return Success(result);
  }
}

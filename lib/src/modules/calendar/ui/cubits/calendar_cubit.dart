import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/extensions/date_time_extension.dart';
import '../../domain/services/i_calendar_service.dart';
import 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final ICalendarService calendarService;

  CalendarCubit({
    required this.calendarService,
  }) : super(const LoadingState());

  Future<void> fetch({
    DateTime? startDate,
    DateTime? endDate,
    bool refreshing = false,
  }) async {
    try {
      log('fetching calendar:\nstartDate: $startDate\nendDate: $endDate');

      if (!refreshing) {
        emit(const LoadingState());
      }

      final result = await calendarService.fetch(
        startDate: startDate,
        endDate: endDate,
      );

      if (result.isError()) {
        return emit(ErrorState(result.exceptionOrNull()!));
      }

      final data = result.getOrThrow();

      final response = groupBy(
        [...data.activities, ...data.daysOff],
        (p) => p.startDate.dateOnly,
      );

      emit(SuccessState(
        data: response,
        busyDates: data.busyDates,
      ));
    } on GenericException catch (e) {
      emit(ErrorState(e));
    } catch (e) {
      emit(ErrorState(UnknowException(error: e)));
    }
  }
}

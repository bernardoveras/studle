import 'package:equatable/equatable.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/i_calendar_child.dart';

sealed class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object?> get props => [];
}

class InitialState extends CalendarState {
  const InitialState();
}

class SuccessState extends CalendarState {
  final Map<DateTime, List<ICalendarChild>> data;
  final List<DateTime> busyDates;

  const SuccessState({
    required this.data,
    required this.busyDates,
  });

  @override
  List<Object?> get props => [data];
}

class LoadingState extends CalendarState {
  const LoadingState();
}

class ErrorState extends CalendarState {
  final GenericException error;

  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

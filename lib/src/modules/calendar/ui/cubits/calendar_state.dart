import 'package:equatable/equatable.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/calendar_entity.dart';

sealed class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object?> get props => [];
}

class InitialState extends CalendarState {
  const InitialState();
}

class SuccessState extends CalendarState {
  final CalendarEntity data;

  const SuccessState({
    required this.data,
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

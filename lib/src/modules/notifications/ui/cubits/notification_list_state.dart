import 'package:equatable/equatable.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/notification_entity.dart';

sealed class NotificationListState extends Equatable {
  const NotificationListState();

  @override
  List<Object?> get props => [];
}

class InitialState extends NotificationListState {
  const InitialState();
}

class SuccessState extends NotificationListState {
  final List<NotificationEntity> allData;
  final List<NotificationEntity> unreadData;

  const SuccessState({
    required this.allData,
    required this.unreadData,
  });

  @override
  List<Object?> get props => [allData, unreadData];
}

class LoadingState extends NotificationListState {
  const LoadingState();
}

class ErrorState extends NotificationListState {
  final GenericException error;

  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

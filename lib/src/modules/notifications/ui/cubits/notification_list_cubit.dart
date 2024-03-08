import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/extension_types/guid.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/enums/notification_status_enum.dart';
import '../../domain/services/i_notification_service.dart';
import 'notification_list_state.dart';

class NotificationListCubit extends Cubit<NotificationListState> {
  final INotificationService notificationService;

  NotificationListCubit({
    required this.notificationService,
  }) : super(const InitialState());

  Future<void> fetch({
    bool refreshing = false,
  }) async {
    try {
      if (!refreshing) {
        emit(const LoadingState());
      }

      await Future.delayed(const Duration(milliseconds: 200));

      final result = await notificationService.fetch();

      if (result.isError()) {
        return emit(ErrorState(result.exceptionOrNull()!));
      }

      final allNotifications = result.getOrDefault([]);

      final unreadNotifications = _sortUnread(allNotifications);

      final unreadNotificationsWithoutLink = unreadNotifications
          .where((e) => e.link == null && !e.isRead)
          .map((e) => e.id)
          .toList();

      if (unreadNotificationsWithoutLink.isNotEmpty) {
        markAsReadBatch(unreadNotificationsWithoutLink).ignore();
      }

      emit(
        SuccessState(
          allData: allNotifications,
          unreadData: unreadNotifications,
        ),
      );
    } on GenericException catch (e) {
      emit(ErrorState(e));
    } catch (e) {
      emit(ErrorState(UnknowException(error: e)));
    }
  }

  Future<void> markAsRead(Guid id) async {
    try {
      if (state is! SuccessState) return;

      final result = await notificationService.markAsRead(id);

      if (result.isError()) {
        return emit(ErrorState(result.exceptionOrNull()!));
      }

      final allNotifications = (state as SuccessState).allData;

      var notification = allNotifications.singleWhereOrNull((x) => x.id == id);

      if (notification == null) {
        return emit(
          ErrorState(
            NotFoundException(
              message: 'Não foi possível encontrar a notificação com id $id.',
            ),
          ),
        );
      }

      final notificationIndex = allNotifications.indexOf(notification);

      notification = notification.copyWith(status: NotificationStatus.read);

      allNotifications[notificationIndex] = notification;

      final unreadNotifications = _sortUnread(allNotifications);

      emit(
        SuccessState(
          allData: allNotifications,
          unreadData: unreadNotifications,
        ),
      );
    } on GenericException catch (e) {
      emit(ErrorState(e));
    } catch (e) {
      emit(ErrorState(UnknowException(error: e)));
    }
  }

  Future<void> markAsReadBatch(List<Guid> ids) async {
    try {
      final result = await notificationService.markAsReadBatch(ids);

      if (result.isError()) {
        return emit(ErrorState(result.exceptionOrNull()!));
      }

      if (state is! SuccessState) return;

      final allNotifications = (state as SuccessState).allData;
      final allNotificationsFiltered =
          allNotifications.where((e) => ids.contains(e.id)).toList();

      for (var notification in allNotificationsFiltered) {
        final notificationIndex = allNotifications.indexOf(notification);

        notification = notification.copyWith(status: NotificationStatus.read);

        allNotifications[notificationIndex] = notification;
      }

      final unreadNotifications = _sortUnread(allNotifications);

      emit(
        SuccessState(
          allData: allNotifications,
          unreadData: unreadNotifications,
        ),
      );
    } on GenericException catch (e) {
      emit(ErrorState(e));
    } catch (e) {
      emit(ErrorState(UnknowException(error: e)));
    }
  }

  List<NotificationEntity> _sortUnread(
    List<NotificationEntity> allNotifications,
  ) {
    return allNotifications.where((x) => !x.isRead).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}

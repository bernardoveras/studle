import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/exceptions.dart';
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

      final result = await notificationService.fetch();

      if (result.isError()) {
        return emit(ErrorState(result.exceptionOrNull()!));
      }

      final allNotifications = result.getOrDefault([]);

      final unreadNotifications = allNotifications
          .where((x) => x.status == NotificationStatus.unread)
          .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

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
}

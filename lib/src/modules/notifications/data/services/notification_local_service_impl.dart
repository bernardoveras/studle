import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/constants/local_storage_key.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/extension_types/guid.dart';
import '../../../../core/services/local_storage/domain/services/i_local_storage_service.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/enums/notification_status_enum.dart';
import '../../domain/services/i_notification_service.dart';

class NotificationLocalServiceImpl implements INotificationService {
  final ILocalStorageService localStorageService;

  NotificationLocalServiceImpl({
    required this.localStorageService,
  });

  @override
  AsyncResult<List<NotificationEntity>, GenericException> fetch() async {
    try {
      final result =
          await localStorageService.read<String>(LocalStorageKey.notifications);

      if (result.isError()) {
        final error = result.exceptionOrNull();

        if (error is NotFoundException) {
          return const Success([]);
        }

        return Failure(result.exceptionOrNull()!);
      }

      final response = result.getOrNull()!;

      final decodedJson = jsonDecode(response);

      if (decodedJson is! List) {
        return const Failure(
          UnknowException(
            message: 'Não foi possível encontrar as notificações. (61dcbc0f)',
          ),
        );
      }

      final notifications =
          decodedJson.map((e) => NotificationEntity.fromMap(e)).toList();

      return Success(notifications);
    } on GenericException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(UnknowException(error: e));
    }
  }

  @override
  AsyncResult<bool, GenericException> markAsRead(Guid id) async {
    try {
      final result =
          await localStorageService.read<String>(LocalStorageKey.notifications);

      final response = result.getOrNull();

      if (result.isError()) {
        final error = result.exceptionOrNull();
        return Failure(error!);
      }

      final decodedJson = jsonDecode(response!);

      if (decodedJson is! List) {
        return Failure(
          NotFoundException(
            message: 'Não foi possível encontrar a notificação com id $id.',
          ),
        );
      }

      final notifications =
          decodedJson.map((e) => NotificationEntity.fromMap(e)).toList();

      var notification = notifications.singleWhereOrNull((x) => x.id == id);

      if (notification == null) {
        return Failure(
          NotFoundException(
            message: 'Não foi possível encontrar a notificação com id $id.',
          ),
        );
      }

      if (notification.isRead) {
        return const Success(true);
      }

      final notificationIndex = notifications.indexOf(notification);

      notification = notification.copyWith(status: NotificationStatus.read);

      notifications[notificationIndex] = notification;

      final notificationsJson =
          jsonEncode(notifications.map((e) => e.toMap()).toList());

      final writeResult = await localStorageService.write<String>(
        LocalStorageKey.notifications,
        notificationsJson,
      );

      if (writeResult.isError()) {
        return writeResult;
      }

      return const Success(true);
    } on GenericException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(UnknowException(error: e));
    }
  }

  @override
  AsyncResult<bool, GenericException> markAsReadBatch(List<Guid> ids) async {
    try {
      final result =
          await localStorageService.read<String>(LocalStorageKey.notifications);

      final response = result.getOrNull();

      if (result.isError()) {
        final error = result.exceptionOrNull();
        return Failure(error!);
      }

      final decodedJson = jsonDecode(response!);

      if (decodedJson is! List) {
        return Failure(
          NotFoundException(
            message: 'Não foi possível encontrar a notificação com ids $ids.',
          ),
        );
      }

      final notifications =
          decodedJson.map((e) => NotificationEntity.fromMap(e)).toList();

      final notificationsFiltered =
          notifications.where((x) => ids.contains(x.id));

      for (var notification in notificationsFiltered) {
        if (notification.isRead) {
          continue;
        }

        final notificationIndex = notifications.indexOf(notification);

        notification = notification.copyWith(status: NotificationStatus.read);

        notifications[notificationIndex] = notification;
      }

      final notificationsJson =
          jsonEncode(notifications.map((e) => e.toMap()).toList());

      final writeResult = await localStorageService.write<String>(
        LocalStorageKey.notifications,
        notificationsJson,
      );

      if (writeResult.isError()) {
        return writeResult;
      }

      return const Success(true);
    } on GenericException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(UnknowException(error: e));
    }
  }
}

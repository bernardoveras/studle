import 'dart:convert';

import 'package:result_dart/result_dart.dart';

import '../../../../core/constants/local_storage_key.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/services/local_storage/domain/services/i_local_storage_service.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/services/i_notification_service.dart';

class NotificationLocalServiceImpl implements INotificationService {
  final ILocalStorageService localStorageService;

  NotificationLocalServiceImpl({
    required this.localStorageService,
  });

  @override
  AsyncResult<List<NotificationEntity>, GenericException> fetch() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      final result =
          await localStorageService.read<String>(LocalStorageKey.notifications);

      if (result.isError()) {
        final error = result.exceptionOrNull();

        if (error is NotFoundException) {
          return const Success([]);
        }

        return Failure(result.exceptionOrNull()!);
      }

      final response = result.getOrNull();

      if (response == null) {
        return const Success([]);
      }

      final decodedJson = jsonDecode(response);

      if (decodedJson is! List) {
        return Failure(
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
}

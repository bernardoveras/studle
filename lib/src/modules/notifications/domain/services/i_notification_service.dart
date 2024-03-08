import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/generic_exception.dart';
import '../../../../core/extension_types/guid.dart';
import '../entities/notification_entity.dart';

abstract interface class INotificationService {
  AsyncResult<List<NotificationEntity>, GenericException> fetch();
  AsyncResult<bool, GenericException> markAsRead(Guid id);
  AsyncResult<bool, GenericException> markAsReadBatch(List<Guid> ids);
}

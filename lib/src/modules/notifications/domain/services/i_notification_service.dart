import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/generic_exception.dart';
import '../entities/notification_entity.dart';

abstract interface class INotificationService {
  AsyncResult<List<NotificationEntity>, GenericException> fetch();
}

import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/generic_exception.dart';
import '../entities/calendar_entity.dart';

abstract interface class ICalendarService {
  AsyncResult<CalendarEntity, GenericException> fetch({
    DateTime? startDate,
    DateTime? endDate,
  });
}

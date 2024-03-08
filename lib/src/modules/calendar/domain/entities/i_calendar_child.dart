import 'package:equatable/equatable.dart';

import '../../../../core/extension_types/guid.dart';

abstract class ICalendarChild extends Equatable {
  final Guid id;
  final DateTime startDate;

  const ICalendarChild({
    required this.id,
    required this.startDate,
  });

  @override
  List<Object?> get props => [id, startDate];
}

import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../domain/entities/calendar_day_off_entity.dart';

class CalendarDayOffCard extends StatelessWidget {
  const CalendarDayOffCard({
    super.key,
    required this.dayOff,
  });

  final CalendarDayOffEntity dayOff;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Atividades acadêmicas suspensas',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Text3Typography(
            color: MonoChromaticColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          dayOff.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Text3Typography(
            color: MonoChromaticColors.gray.v900,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

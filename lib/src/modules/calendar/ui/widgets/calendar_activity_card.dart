import 'package:flutter/material.dart';

import '../../../../core/helpers/date_helper.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../domain/entities/calendar_activity_entity.dart';

class CalendarActivityCard extends StatelessWidget {
  const CalendarActivityCard({
    super.key,
    required this.activity,
  });

  final CalendarActivityEntity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          activity.teacherName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Text3Typography(
            color: MonoChromaticColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          activity.schoolSubjects,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Text3Typography(
            color: MonoChromaticColors.gray.v900,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '${DateHelper.format(activity.startDate, pattern: 'HH:mm')} - ${DateHelper.format(activity.endDate, pattern: 'HH:mm')}',
              style: Text3Typography(
                color: MonoChromaticColors.gray,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Badge(
                backgroundColor: MonoChromaticColors.gray,
                smallSize: 4,
              ),
            ),
            Text(
              activity.location,
              style: Text3Typography(
                color: MonoChromaticColors.gray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

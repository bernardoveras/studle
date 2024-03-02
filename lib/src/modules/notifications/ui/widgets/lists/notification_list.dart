import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/ui/design_system/design_system.dart';
import '../../../domain/entities/notification_entity.dart';
import '../notification_card.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({
    super.key,
    required this.data,
  });

  final List<NotificationEntity> data;

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      key: widget.key,
      itemCount: widget.data.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16 + MediaQuery.paddingOf(context).bottom,
      ),
      separatorBuilder: (_, __) => Container(
        height: 1.5,
        color: MonoChromaticColors.divider,
        margin: const EdgeInsets.only(bottom: 24),
      ),
      itemBuilder: (_, index) {
        final notification = widget.data[index];
        return Animate(
          delay: Duration(milliseconds: 150 * index),
          effects: [
            FadeEffect(
              curve: Curves.ease,
              duration: 300.ms,
            ),
            ScaleEffect(
              begin: const Offset(0.98, 0.9),
              alignment: Alignment.topLeft,
              curve: Curves.ease,
              duration: 300.ms,
            ),
          ],
          child: NotificationCard(
            notification: notification,
          ),
        );
      },
    );
  }
}

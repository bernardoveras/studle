import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/enums/notification_status_enum.dart';
import '../widgets/notification_card.dart';
import '../widgets/notification_tab_bar.dart';

class NotificationListPage extends StatefulWidget {
  const NotificationListPage({super.key});

  static String get route => '/notifications';

  @override
  State<NotificationListPage> createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const DefaultAppBar(
          title: 'Notificações',
        ),
        body: Column(
          children: [
            const NotificationTabBar(),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 16 + MediaQuery.paddingOf(context).bottom,
                ),
                separatorBuilder: (context, index) => Container(
                  height: 1.5,
                  color: MonoChromaticColors.divider,
                  margin: const EdgeInsets.only(bottom: 24),
                ),
                itemBuilder: (context, index) {
                  final notification = NotificationEntity(
                    id: 1,
                    title: 'Open Design 2023',
                    description:
                        'Não fique de fora do Open! Garante sua inscrição no maior evento de design da região!',
                    status: NotificationStatus.unread,
                    createdAt: DateTime.now(),
                  );

                  return NotificationCard(
                    notification: notification,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

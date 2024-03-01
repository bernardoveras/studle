import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/default_app_bar.dart';
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
            SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16 + MediaQuery.paddingOf(context).bottom,
              ),
              child: const Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

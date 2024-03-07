import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/user_session.dart';
import '../../../calendar/ui/pages/calendar_page.dart';
import '../../../notifications/ui/pages/notification_list_page.dart';
import '../../../profile/ui/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String get route => '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserSession userSession;

  @override
  void initState() {
    super.initState();

    userSession = Injector.resolve();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Home',
        actions: [
          IconButton(
            onPressed: () => context.push(NotificationListPage.route),
            splashColor: Colors.transparent,
            icon: const Icon(
              PhosphorIconsRegular.bellSimple,
            ),
          ),
          IconButton(
            onPressed: () => context.push(ProfilePage.route),
            splashColor: Colors.transparent,
            icon: const Icon(
              PhosphorIconsRegular.user,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SolidButton.primary(
              label: 'Calendário',
              onPressed: () => context.push(CalendarPage.route),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/extensions/query_parameters_extension.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/user_session.dart';
import '../../../activities/ui/pages/additional_activities_page.dart';
import '../../../calendar/ui/pages/calendar_page.dart';
import '../../../campaigns/ui/pages/campaign_page.dart';
import '../../../campaigns/ui/parameters/campaign_page_parameter.dart';
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
              onPressed: () => context.push(CalendarPage.route
                  .addQuery('?date=${DateTime(2024, 3, 7).toIso8601String()}')),
            ),
            const SizedBox(height: 16),
            SolidButton.primary(
              label: 'Atividades complementares',
              onPressed: () => context.push(AdditionalActivitiesPage.route),
            ),
            const SizedBox(height: 16),
            SolidButton.primary(
              label: 'Campanha',
              onPressed: () => context.push(
                CampaignPage.route.addQuery(
                  const CampaignPageParameter(
                    title: 'Open Design 2024',
                    description:
                        '''Não fique de fora do Open! Garanta sua inscrição no maior evento de design da região!

Se inscreva até dia 31/05 na entrada do evento! Os pagamentos serão feitos na hora por PIX, na área de credenciamento do auditório do bloco F. Corre que ainda dá tempo! 💜
''',
                    link: 'https://google.com',
                    bannerUrl:
                        'https://img.freepik.com/premium-vector/trendy-event-banner-template_85212-590.jpg',
                  ).toQueryParameters(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

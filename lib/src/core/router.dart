import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../modules/activities/ui/pages/additional_activities_page.dart';
import '../modules/authentication/ui/pages/login_page.dart';
import '../modules/authentication/ui/store/login_store.dart';
import '../modules/calendar/ui/cubits/calendar_cubit.dart';
import '../modules/calendar/ui/pages/calendar_page.dart';
import '../modules/campaigns/ui/pages/campaign_page.dart';
import '../modules/campaigns/ui/parameters/campaign_page_parameter.dart';
import '../modules/financial/ui/pages/financial_page.dart';
import '../modules/home/ui/pages/home_page.dart';
import '../modules/notifications/ui/cubits/notification_list_cubit.dart';
import '../modules/notifications/ui/pages/notification_list_page.dart';
import '../modules/onboarding/ui/pages/onboarding_page.dart';
import '../modules/onboarding/ui/stores/onboarding_store.dart';
import '../modules/profile/ui/pages/personal_data_page.dart';
import '../modules/profile/ui/pages/profile_page.dart';
import '../modules/profile/ui/pages/student_identity_page.dart';
import '../modules/questions/ui/pages/question_page.dart';
import 'dependecy_injection/injector.dart';
import 'route_guard.dart';
import 'user_session.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: LoginPage.route,
    routes: [
      GoRoute(
        path: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: CalendarPage.route,
        builder: (context, state) => BlocProvider.value(
          value: CalendarCubit(
            calendarService: Injector.resolve(),
          ),
          child: CalendarPage(
            initialDate: state.uri.queryParameters['date'] != null
                ? DateTime.parse(state.uri.queryParameters['date']!)
                : null,
            initialMonth: state.uri.queryParameters['month'] != null
                ? int.tryParse(state.uri.queryParameters['month']!)
                : null,
          ),
        ),
      ),
      GoRoute(
        path: NotificationListPage.route,
        builder: (context, state) => BlocProvider.value(
          value: NotificationListCubit(
            notificationService: Injector.resolve(),
          ),
          child: const NotificationListPage(),
        ),
      ),
      GoRoute(
        path: ProfilePage.route,
        builder: (context, state) => const ProfilePage(),
        routes: [
          GoRoute(
            path: PersonalDataPage.subRoute,
            builder: (context, state) => const PersonalDataPage(),
          ),
          GoRoute(
            path: StudentIdentityPage.subRoute,
            builder: (context, state) => const StudentIdentityPage(),
          ),
        ],
      ),
      GoRoute(
        path: OnboardingPage.route,
        builder: (context, state) => ChangeNotifierProvider.value(
          value: OnboardingStore(
            userSession: Injector.resolve(),
          ),
          child: const OnboardingPage(),
        ),
      ),
      GoRoute(
        path: CampaignPage.route,
        builder: (context, state) => CampaignPage(
          parameters: CampaignPageParameter.fromQueryParameters(
            state.uri.queryParameters,
          ),
        ),
      ),
      GoRoute(
        path: LoginPage.route,
        builder: (context, state) => ChangeNotifierProvider.value(
          value: LoginStore(
            authService: Injector.resolve(),
            userSession: Injector.resolve(),
          ),
          child: LoginPage(
            from: state.uri.queryParameters['from'],
          ),
        ),
      ),
      GoRoute(
        path: QuestionPage.route,
        builder: (context, state) => const QuestionPage(),
      ),
      GoRoute(
        path: AdditionalActivitiesPage.route,
        builder: (context, state) => const AdditionalActivitiesPage(),
      ),
      GoRoute(
        path: FinancialPage.route,
        builder: (context, state) => const FinancialPage(),
      ),
    ],
    redirect: RouteGuard.redirect,
    refreshListenable: Injector.resolve<UserSession>(),
  );
}

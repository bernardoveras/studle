import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../modules/authentication/ui/pages/login_page.dart';
import '../modules/authentication/ui/store/login_store.dart';
import '../modules/campaigns/ui/pages/campaign_page.dart';
import '../modules/campaigns/ui/parameters/campaign_page_parameter.dart';
import '../modules/home/ui/pages/home_page.dart';
import '../modules/onboarding/ui/pages/onboarding_page.dart';
import '../modules/onboarding/ui/stores/onboarding_store.dart';
import 'dependecy_injection/injector.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: OnboardingPage.route,
    routes: [
      GoRoute(
        path: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: OnboardingPage.route,
        builder: (context, state) => ChangeNotifierProvider.value(
          value: OnboardingStore(),
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
          child: const LoginPage(),
        ),
      ),
    ],
  );
}

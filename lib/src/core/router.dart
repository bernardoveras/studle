import 'package:go_router/go_router.dart';
import 'package:myschool/src/modules/authentication/ui/store/login_store.dart';
import 'package:provider/provider.dart';

import '../modules/authentication/ui/pages/login_page.dart';
import '../modules/home/ui/pages/home_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: LoginPage.route,
    routes: [
      GoRoute(
        path: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: LoginPage.route,
        builder: (context, state) => ChangeNotifierProvider.value(
          value: LoginStore(),
          child: const LoginPage(),
        ),
      ),
    ],
  );
}

import 'package:go_router/go_router.dart';

import '../modules/home/ui/pages/home_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}

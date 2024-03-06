import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/authentication/ui/pages/login_page.dart';
import '../modules/questions/ui/pages/question_page.dart';
import '../modules/onboarding/ui/pages/onboarding_page.dart';
import 'dependecy_injection/injector.dart';
import 'user_session.dart';

abstract class RouteGuard {
  static FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final userSession = Injector.resolve<UserSession>();

    if (userSession.firstAccess) {
      return OnboardingPage.route;
    }

    /// if the user is not logged in, they need to login
    final loggedIn = userSession.isLogged;
    final loggingIn = state.matchedLocation == LoginPage.route;

    if (!loggedIn && state.matchedLocation == QuestionPage.route) {
      return QuestionPage.route;
    }

    /// bundle the location the user is coming from into a query parameter
    final fromp =
        state.matchedLocation == '/' ? '' : '?from=${state.matchedLocation}';

    if (!loggedIn) return loggingIn ? null : '${LoginPage.route}$fromp';

    if (loggingIn) return state.uri.queryParameters['from'] ?? '/';

    return null;
  }
}

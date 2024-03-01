import 'package:get_it/get_it.dart';

import '../../modules/authentication/data/services/auth_mock_service_impl.dart';
import '../../modules/authentication/domain/services/i_auth_service.dart';
import '../user_session.dart';

extension InjectorExtension on GetIt {
  GetIt registerAuthenticationServices() {
    return this
      ..registerLazySingleton<IAuthService>(
        () => AuthMockServiceImpl(),
      );
  }

  GetIt registerUserSession() {
    return this
      ..registerLazySingleton<UserSession>(
        () => UserSession(),
      );
  }
}

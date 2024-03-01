import 'package:get_it/get_it.dart';

import '../../modules/authentication/data/services/auth_mock_service_impl.dart';
import '../../modules/authentication/domain/services/i_auth_service.dart';

extension InjectorExtension on GetIt {
  GetIt registerAuthenticationServices() {
    return this
      ..registerLazySingleton<IAuthService>(
        () => AuthMockServiceImpl(),
      );
  }
}

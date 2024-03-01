import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/authentication/data/services/auth_mock_service_impl.dart';
import '../../modules/authentication/domain/entities/user_entity.dart';
import '../../modules/authentication/domain/services/i_auth_service.dart';
import '../constants/local_storage_key.dart';
import '../services/local_storage/data/services/local_storage_shared_preferences_service_impl.dart';
import '../services/local_storage/domain/services/i_local_storage_service.dart';
import '../user_session.dart';
import 'injector.dart';

extension InjectorExtension on GetIt {
  GetIt registerAuthenticationServices() {
    return this
      ..registerLazySingleton<IAuthService>(
        () => AuthMockServiceImpl(),
      );
  }

  GetIt registerLocalStorageServices() {
    return this
      ..registerSingletonAsync<ILocalStorageService>(
        () async => LocalStorageSharedPreferencesServiceImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
      );
  }

  GetIt registerUserSession() {
    return this
      ..registerSingletonAsync<UserSession>(
        () async {
          final localStorage = Injector.resolve<ILocalStorageService>();

          final firstAccess =
              (await localStorage.read<bool>(LocalStorageKey.firstAccess))
                      .getOrNull() ??
                  true;
          final user = (await localStorage.read<String>(LocalStorageKey.user))
              .getOrNull();

          return UserSession(
            firstAccess: firstAccess,
            user: user == null ? null : UserEntity.fromJson(user),
            localStorageService: Injector.resolve(),
          );
        },
        dependsOn: [
          ILocalStorageService,
        ],
      );
  }
}

import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/generic_exception.dart';
import '../../domain/dtos/login_with_student_registration_dto.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/services/i_auth_service.dart';

class AuthFirebaseServiceImpl implements IAuthService {
  @override
  AsyncResult<UserEntity, GenericException> loginWithStudentRegistration(
    LoginWithStudentRegistrationDto dto,
  ) async {
    //IMPLEMNTACAO DO FIREBASE...
    const user = UserEntity(
      id: 1,
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      cpf: '00000000000',
    );

    return const Success(user);
  }
}

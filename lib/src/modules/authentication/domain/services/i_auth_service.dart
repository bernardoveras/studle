import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../dtos/login_with_student_registration_dto.dart';
import '../entities/user_entity.dart';

abstract interface class IAuthService {
  AsyncResult<UserEntity, GenericException> loginWithStudentRegistration(
    LoginWithStudentRegistrationDto dto,
  );
}

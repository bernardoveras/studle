import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/generic_exception.dart';
import '../../../../core/exceptions/invalid_credentials_exception.dart';
import '../../../../core/extension_types/guid.dart';
import '../../domain/dtos/login_with_student_registration_dto.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/enums/person_gender_enum.dart';
import '../../domain/services/i_auth_service.dart';

class AuthMockServiceImpl implements IAuthService {
  @override
  AsyncResult<UserEntity, GenericException> loginWithStudentRegistration(
    LoginWithStudentRegistrationDto dto,
  ) async {
    const mockLogin = '00123456';
    const mockPassword = '123456';

    await Future.delayed(const Duration(seconds: 1));

    if (dto.registration != mockLogin || dto.password != mockPassword) {
      return const Failure(InvalidCredentialsException());
    }

    final user = UserEntity(
      id: Guid.random(),
      accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
      refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
      name: 'Bernardo Veras',
      email: 'contato@bernardoveras.com.br',
      registrationNumber: '00123456',
      cpf: '00000000000',
      pictureUrl: 'https://avatars.githubusercontent.com/u/56937988?v=4',
      phoneNumber: '99999999999',
      birthday: DateTime(2003, 5, 19),
      gender: PersonGender.masculine,
      addressStreet: 'Rua Brigadeiro Tobias',
      addressNumber: '123',
      addressNeighborhood: 'Centro',
      addressCity: 'São Miguel Arcanjo',
      addressZipCode: '18230000',
      addressState: 'São Paulo',
      startYear: '2023',
      validityYear: '2024',
    );

    return Success(user);
  }
}

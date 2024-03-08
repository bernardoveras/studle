import 'package:studle/src/core/extension_types/guid.dart';
import 'package:studle/src/modules/authentication/domain/entities/user_entity.dart';
import 'package:studle/src/modules/authentication/domain/enums/person_gender_enum.dart';

final entity = UserEntity(
  id: Guid.empty(),
  accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
  refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
  name: 'Bernardo Veras',
  email: 'contato@bernardoveras.com.br',
  registrationNumber: '00123456',
  cpf: '00000000000',
  pictureUrl: 'https://google.com',
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

final map = <String, dynamic>{
  'id': Guid.empty(),
  'access_token': '6aa50a1a77db4163bcf3ee2a2a0115fb',
  'refresh_token': '48b38423c45f4daaab8d7ed782fb8dc8',
  'name': 'Bernardo Veras',
  'email': 'contato@bernardoveras.com.br',
  'registration_number': '00123456',
  'cpf': '00000000000',
  'picture_url': 'https://google.com',
  'phone_number': '99999999999',
  'birthday': '2003-05-19T00:00:00.000',
  'gender': 1,
  'address_street': 'Rua Brigadeiro Tobias',
  'address_number': '123',
  'address_neighborhood': 'Centro',
  'address_city': 'São Miguel Arcanjo',
  'address_zip_code': '18230000',
  'address_state': 'São Paulo',
  'start_year': '2023',
  'validity_year': '2024',
};

final json =
    '{"id":"${Guid.empty()}","access_token":"6aa50a1a77db4163bcf3ee2a2a0115fb","refresh_token":"48b38423c45f4daaab8d7ed782fb8dc8","name":"Bernardo Veras","email":"contato@bernardoveras.com.br","registration_number":"00123456","cpf":"00000000000","picture_url":"https://google.com","phone_number":"99999999999","birthday":"2003-05-19T00:00:00.000","gender":1,"address_street":"Rua Brigadeiro Tobias","address_number":"123","address_neighborhood":"Centro","address_city":"São Miguel Arcanjo","address_zip_code":"18230000","address_state":"São Paulo","start_year":"2023","validity_year":"2024"}';

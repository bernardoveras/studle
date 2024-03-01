import 'package:myschool/src/modules/authentication/domain/entities/user_entity.dart';

const entity = UserEntity(
  id: 1,
  accessToken: '6aa50a1a77db4163bcf3ee2a2a0115fb',
  refreshToken: '48b38423c45f4daaab8d7ed782fb8dc8',
  name: 'Bernardo Veras',
  email: 'contato@bernardoveras.com.br',
  cpf: '00000000000',
);

const map = <String, dynamic>{
  'id': 1,
  'access_token': '6aa50a1a77db4163bcf3ee2a2a0115fb',
  'refresh_token': '48b38423c45f4daaab8d7ed782fb8dc8',
  'name': 'Bernardo Veras',
  'email': 'contato@bernardoveras.com.br',
  'cpf': '00000000000',
};

const json =
    '{"id":1,"access_token":"6aa50a1a77db4163bcf3ee2a2a0115fb","refresh_token":"48b38423c45f4daaab8d7ed782fb8dc8","name":"Bernardo Veras","email":"contato@bernardoveras.com.br","cpf":"00000000000"}';

import 'package:studle/src/core/extension_types/guid.dart';
import 'package:studle/src/modules/notifications/domain/entities/notification_entity.dart';
import 'package:studle/src/modules/notifications/domain/enums/notification_link_type_enum.dart';
import 'package:studle/src/modules/notifications/domain/enums/notification_status_enum.dart';

final entity = NotificationEntity(
  id: Guid.empty(),
  title: '6º Encontro de Clássicos na Studle',
  description:
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  status: NotificationStatus.read,
  createdAt: DateTime(2024, 2, 14, 12, 50),
);

final entityWithLink = NotificationEntity(
  id: Guid.empty(),
  title: '6º Encontro de Clássicos na Studle',
  description:
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  link: 'https://google.com',
  linkType: NotificationLinkType.redirectToSite,
  status: NotificationStatus.read,
  createdAt: DateTime(2024, 2, 14, 12, 50),
);

final map = <String, dynamic>{
  'id': Guid.empty(),
  'title': '6º Encontro de Clássicos na Studle',
  'description':
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  'status': 0,
  'created_at': '2024-02-14T12:50:00.000',
};
final mapWithLink = <String, dynamic>{
  'id': Guid.empty(),
  'title': '6º Encontro de Clássicos na Studle',
  'description':
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  'link': 'https://google.com',
  'link_type': 1,
  'status': 0,
  'created_at': '2024-02-14T12:50:00.000',
};

final json =
    '{"id":"${Guid.empty()}","title":"6º Encontro de Clássicos na Studle","description":"Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!","status":0,"created_at":"2024-02-14T12:50:00.000"}';

final jsonWithLink =
    '{"id":"${Guid.empty()}","title":"6º Encontro de Clássicos na Studle","description":"Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!","link":"https://google.com","link_type":1,"status":0,"created_at":"2024-02-14T12:50:00.000"}';

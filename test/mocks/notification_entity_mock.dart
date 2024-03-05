import 'package:myschool/src/modules/notifications/domain/entities/notification_entity.dart';
import 'package:myschool/src/modules/notifications/domain/enums/notification_link_type_enum.dart';
import 'package:myschool/src/modules/notifications/domain/enums/notification_status_enum.dart';

final entity = NotificationEntity(
  id: 1,
  title: '6º Encontro de Clássicos na My School',
  description:
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  status: NotificationStatus.read,
  createdAt: DateTime(2024, 2, 14, 12, 50),
);

final entityWithLink = NotificationEntity(
  id: 1,
  title: '6º Encontro de Clássicos na My School',
  description:
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  link: 'https://google.com',
  linkType: NotificationLinkType.redirectToSite,
  status: NotificationStatus.read,
  createdAt: DateTime(2024, 2, 14, 12, 50),
);

const map = <String, dynamic>{
  'id': 1,
  'title': '6º Encontro de Clássicos na My School',
  'description':
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  'status': 0,
  'created_at': '2024-02-14T12:50:00.000',
};

const mapWithLink = <String, dynamic>{
  'id': 1,
  'title': '6º Encontro de Clássicos na My School',
  'description':
      'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
  'link': 'https://google.com',
  'link_type': 1,
  'status': 0,
  'created_at': '2024-02-14T12:50:00.000',
};

const json =
    '{"id":1,"title":"6º Encontro de Clássicos na My School","description":"Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!","status":0,"created_at":"2024-02-14T12:50:00.000"}';

const jsonWithLink =
    '{"id":1,"title":"6º Encontro de Clássicos na My School","description":"Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!","link":"https://google.com","link_type":1,"status":0,"created_at":"2024-02-14T12:50:00.000"}';

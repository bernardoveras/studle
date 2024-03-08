import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'src/app.dart';
import 'src/core/constants/local_storage_key.dart';
import 'src/core/dependecy_injection/injector.dart';
import 'src/core/extension_types/guid.dart';
import 'src/core/services/local_storage/domain/services/i_local_storage_service.dart';
import 'src/modules/notifications/domain/entities/notification_entity.dart';
import 'src/modules/notifications/domain/enums/notification_link_type_enum.dart';
import 'src/modules/notifications/domain/enums/notification_status_enum.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set default locale
  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting('pt_BR');

  /// Lock app orientation in portrait mode.
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// Remove status bar color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );

  /// Register all dependencies
  Injector.registerDependencies();
  await Injector.allReady();

  /// Insert mock notifications
  final localStorageService = Injector.resolve<ILocalStorageService>();

  await localStorageService.write(
      LocalStorageKey.notifications,
      jsonEncode([
        NotificationEntity(
          id: Guid.random(),
          title: 'Open Design 2024',
          description:
              'Não fique de fora do Open! Garante sua inscrição no maior evento de design da região!',
          status: NotificationStatus.unread,
          createdAt: DateTime(2024, 2, 16, 15, 20),
        ),
        NotificationEntity(
          id: Guid.random(),
          title: '6º Encontro de Clássicos na Studle',
          description:
              'Já estamos em fevereiro e o evento mais aguardado pelos amantes de carro chegou!',
          status: NotificationStatus.unread,
          createdAt: DateTime(2024, 2, 14, 12, 50),
          link: 'https://google.com',
          linkType: NotificationLinkType.redirectToSite,
        ),
        NotificationEntity(
          id: Guid.random(),
          title: 'Nova matéria',
          description: 'Foi cadastrada uma nova matéria no seu registro! 🥳📚',
          status: NotificationStatus.unread,
          createdAt: DateTime(2024, 3, 1, 12, 50),
        ),
        NotificationEntity(
          id: Guid.random(),
          title: 'Reitoria',
          description:
              'Participe da campanha do Vestibular 2024! A seleção está acontecendo hoje (30/08), das 20h às 23h',
          status: NotificationStatus.unread,
          createdAt: DateTime(2024, 3, 1, 12, 30),
        ),
      ].map((e) => e.toMap()).toList()));

  runApp(const App());
}

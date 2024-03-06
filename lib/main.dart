import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'src/app.dart';
import 'src/core/dependecy_injection/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Configure Intl.
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

  Injector.registerDependencies();
  await Injector.allReady();

  runApp(const App());
}

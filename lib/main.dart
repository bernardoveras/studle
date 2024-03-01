import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/core/dependecy_injection/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Injector.registerDependencies();
  await Injector.allReady();

  runApp(const App());
}

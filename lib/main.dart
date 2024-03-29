import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'setup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // sets up the internal locator
  await setupLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown])
      .then((_) {
    runApp(ProviderScope(child: MyApp()));
  });
}


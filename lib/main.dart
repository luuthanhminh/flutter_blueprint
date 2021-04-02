import 'package:fl_blueprint/app/app_router.dart';
import 'package:fl_blueprint/app/setup_locator.dart';
import 'package:fl_blueprint/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // sets up the internal locator
  await setupLocator();

  

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown])
      .then((_) {
    runApp(ProviderScope(child: new MyApp()));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: Size(375, 812),
    builder: () {
      return MaterialApp(
          title: 'Carousel Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: AppRoute.generateRoute,
          initialRoute: AppRoute.cardsPage,
          navigatorKey: NavigationService.navigationKey);
    });
  }
}

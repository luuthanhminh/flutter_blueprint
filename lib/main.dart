import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app_router.dart';
import 'app/setup_locator.dart';
import 'services/navigation_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // sets up the internal locator
  await setupLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown])
      .then((_) {
    runApp(ProviderScope(child: MyApp()));
  });
}

/// Main Application
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
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              onGenerateRoute: AppRoute.generateRoute,
              initialRoute: AppRoute.cardsPage,
              navigatorKey: NavigationService.navigationKey);
        });
  }
}

import 'package:fl_blueprint/pages/cards_page.dart';
import 'package:fl_blueprint/pages/components_page.dart';
import 'package:fl_blueprint/pages/in_app_browser_page.dart';
import 'package:fl_blueprint/pages/screen2.dart';
import 'package:fl_blueprint/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const cardsPage = '/cards';
  static const screen2Page = '/screen2';
  static const componentsPage = '/components';
  static const inAppWebViewPage = '/webview';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cardsPage:
        return MaterialPageRoute(builder: (_) => CardsPage());
      case screen2Page:
        return MaterialPageRoute(builder: (_) => Screen2());
      case componentsPage:
        return MaterialPageRoute(builder: (_) => ComponentsPage());
      case inAppWebViewPage:
        return MaterialPageRoute(
            builder: (_) => InAppWebViewExampleScreen(settings.arguments));
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
        ;
    }
  }
}

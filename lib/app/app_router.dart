import 'package:flutter/material.dart';

import '../pages/cards_page.dart';
import '../pages/components_page.dart';
import '../pages/in_app_browser_page.dart';
import '../pages/screen2.dart';
import '../pages/splash_page.dart';

/// Manage all routes in the application
class AppRoute {
  /// Card Page route
  static const cardsPage = '/cards';

  /// Screen2 Page route
  static const screen2Page = '/screen2';

  /// Component Page route
  static const componentsPage = '/components';

  /// InAppWebView Page route
  static const inAppWebViewPage = '/webview';

  /// App router generation
  static Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cardsPage:
        return MaterialPageRoute(builder: (_) => CardsPage());
      case screen2Page:
        return MaterialPageRoute(builder: (_) => Screen2());
      case componentsPage:
        return MaterialPageRoute(builder: (_) => ComponentsPage());
      case inAppWebViewPage:
        return MaterialPageRoute(
            builder: (_) =>
                InAppWebViewExampleScreen(settings.arguments as String));
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}

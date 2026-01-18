import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/main_screen/view.dart';
import 'package:usa_observer_app/features/splash_screen/view.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String main = '/main';

  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    main: (_) => const MainScreen(),
  };
}

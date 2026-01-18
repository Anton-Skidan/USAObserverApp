import 'package:flutter/material.dart';
import 'package:usa_observer_app/main/app_routes.dart';
import 'package:usa_observer_app/theme/app_theme.dart';

class UsaObserverApp extends StatelessWidget {
  const UsaObserverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'USAObserver',
      theme: AppTheme.light(),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
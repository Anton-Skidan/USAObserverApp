import 'package:flutter/material.dart';
import 'package:usa_observer_app/main/appRoutes.dart';
import 'package:usa_observer_app/theme/app_theme.dart';

void main() {
  runApp(const UsaObserverApp());
}

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

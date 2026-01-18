import 'package:flutter/material.dart';
import 'package:usa_observer_app/main/appRoutes.dart';

void main() {
  runApp(const UsaObserverApp());
}

class UsaObserverApp extends StatelessWidget {
  const UsaObserverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USAObserver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}

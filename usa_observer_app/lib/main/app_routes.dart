import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/main_screen/models/models.dart';
import 'package:usa_observer_app/features/main_screen/view.dart';
import 'package:usa_observer_app/features/population_screen/view.dart';
import 'package:usa_observer_app/features/splash_screen/view.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String main = '/main';
  static const String category = '/category';

  /// Rotues without arguments
  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    main: (_) => const MainScreen(),
  };

  /// Routes with arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case category:
        final type = settings.arguments as CategoryType;

        return MaterialPageRoute(
          builder: (_) => _buildCategoryScreen(type),
          settings: settings,
        );

      default:
        return null;
    }
  }

  static Widget _buildCategoryScreen(CategoryType type) {
    switch (type) {
      case CategoryType.population:
        return const PopulationScreen();

      // TODO: Implement other categories

      default:
        return const Scaffold(
          body: Center(child: Text('Категория пока не реализована')),
        );
    }
  }
}

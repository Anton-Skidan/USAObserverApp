import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/main_screen/models/models.dart';
import 'package:usa_observer_app/features/main_screen/views/category_card.dart';
import 'package:usa_observer_app/core/app_routes.dart';

class MainScreen extends StatelessWidget {
  static const double _tabletBreakpoint = 600;
  static const double _gridSpacing = 16;
  static const double _childAspectRatio = 1.1;
  static const EdgeInsets _padding = EdgeInsets.all(12);

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Categories.all;

    return Scaffold(
      appBar: AppBar(title: const Text('USA Observer'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: _padding,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isTablet = constraints.maxWidth >= _tabletBreakpoint;
              final crossAxisCount = isTablet ? 3 : 2;

              return GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: _gridSpacing,
                  mainAxisSpacing: _gridSpacing,
                  childAspectRatio: _childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return CategoryCard(
                    category: category,
                    onTap: () => _onCategoryTap(context, category.type),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCategoryTap(BuildContext context, CategoryType type) {
    Navigator.of(context).pushNamed(AppRoutes.category, arguments: type);
  }
}

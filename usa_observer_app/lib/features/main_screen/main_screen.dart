import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/main_screen/models/models.dart';
import 'package:usa_observer_app/features/main_screen/views/category_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Categories.all;

    return Scaffold(
      appBar: AppBar(title: const Text('USA Observer'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth >= 600;

            return GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
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
    );
  }

  void _onCategoryTap(BuildContext context, CategoryType type) {
    Navigator.of(context).pushNamed('/category', arguments: type);
  }
}

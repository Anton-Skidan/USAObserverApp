import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/main_screen/models/models.dart';

class CategoryCard extends StatelessWidget {
  static const BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(16),
  );

  final Category category;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      button: true,
      label: category.title,
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: _borderRadius,
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.emoji, style: const TextStyle(fontSize: 32)),
                const Spacer(),
                Text(category.title, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(category.description, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

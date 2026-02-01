import 'package:flutter/material.dart';
import 'package:usa_observer_app/network/population/models/models.dart';

class PopulationCard extends StatelessWidget {
  static const double _padding = 16;
  static const double _borderRadius = 12;
  static const double _spacingSmall = 4;
  static const double _spacingMedium = 8;

  const PopulationCard({
    super.key,
    required this.model,
    this.highlight = false,
  });

  final PopulationModel model;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        color: highlight
            ? colorScheme.primary.withOpacity(0.08)
            : theme.cardColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: highlight ? colorScheme.primary : theme.dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.state, style: theme.textTheme.titleMedium),
          const SizedBox(height: _spacingSmall),
          Text('Year: ${model.year}', style: theme.textTheme.bodySmall),
          const SizedBox(height: _spacingMedium),
          Text(
            _formatPopulation(model.population),
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static String _formatPopulation(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      final remaining = digits.length - i - 1;
      if (remaining > 0 && remaining % 3 == 0) {
        buffer.write(',');
      }
    }

    return buffer.toString();
  }
}

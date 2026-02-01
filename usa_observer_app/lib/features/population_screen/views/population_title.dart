import 'package:flutter/material.dart';
import 'package:usa_observer_app/network/population/models/models.dart';

class PopulationTile extends StatelessWidget {
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  const PopulationTile({
    super.key,
    required this.model,
    this.isHighlighted = false,
  });

  final PopulationModel model;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final populationText = _formatPopulation(model.population);

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: isHighlighted
            ? theme.colorScheme.primary.withValues(alpha: 0.08)
            : null,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHighlighted ? theme.colorScheme.primary : theme.dividerColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.year.toString(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            populationText,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  static String _formatPopulation(int value) {
    final digits = value.toString().split('').reversed.toList();
    final buffer = StringBuffer();

    for (var i = 0; i < digits.length; i++) {
      if (i != 0 && i % 3 == 0) {
        buffer.write(' ');
      }
      buffer.write(digits[i]);
    }

    return buffer.toString().split('').reversed.join();
  }
}

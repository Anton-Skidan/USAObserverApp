import 'package:flutter/material.dart';
import 'package:usa_observer_app/network/population/models/models.dart';

class PopulationCard extends StatelessWidget {
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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: highlight
            ? theme.colorScheme.primary.withValues(alpha: 0.08)
            : theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: highlight ? theme.colorScheme.primary : theme.dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.state, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text('Year: ${model.year}', style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          Text(
            _formatNumber(model.population),
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(int value) {
    final buffer = StringBuffer();
    final digits = value.toString().split('');

    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      final positionFromEnd = digits.length - i - 1;
      if (positionFromEnd % 3 == 0 && positionFromEnd != 0) {
        buffer.write(',');
      }
    }

    return buffer.toString();
  }
}

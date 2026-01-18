import 'package:flutter/material.dart';
import 'package:usa_observer_app/network/population/models/models.dart';

class PopulationTile extends StatelessWidget {
  final PopulationModel model;
  final bool highlight;

  const PopulationTile({
    super.key,
    required this.model,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final populationText = _formatNumber(model.population);

    return ListTile(
      tileColor: highlight
          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.8)
          : null,
      title: Text(
        model.year.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        populationText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: highlight ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }

  String _formatNumber(int value) {
    final str = value.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < str.length; i++) {
      final reverseIndex = str.length - i;
      buffer.write(str[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write(' ');
      }
    }

    return buffer.toString();
  }
}

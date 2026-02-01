import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/population_screen/views/population_card.dart';
import 'package:usa_observer_app/network/population/models/models.dart';

class PopulationList extends StatelessWidget {
  const PopulationList(this.data, {super.key});

  final List<PopulationModel> data;

  @override
  Widget build(BuildContext context) {
    final sorted = [...data]
      ..sort((a, b) => b.population.compareTo(a.population));

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: sorted.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = sorted[index];
        final isTop = index == 0;

        return PopulationCard(
          model: item,
          highlight: isTop,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/population_screen/views/population_card.dart';
import 'package:usa_observer_app/network/population/models/models.dart';

class PopulationList extends StatelessWidget {
  static const EdgeInsets _padding = EdgeInsets.all(16);
  static const double _itemSpacing = 12;

  const PopulationList(this.data, {super.key});

  final List<PopulationModel> data;

  @override
  Widget build(BuildContext context) {
    final sortedData = _sortByPopulationDesc(data);

    return ListView.separated(
      padding: _padding,
      itemCount: sortedData.length,
      separatorBuilder: (_, __) => const SizedBox(height: _itemSpacing),
      itemBuilder: (context, index) {
        final item = sortedData[index];

        return PopulationCard(model: item, highlight: index == 0);
      },
    );
  }

  static List<PopulationModel> _sortByPopulationDesc(
    List<PopulationModel> source,
  ) {
    final result = List<PopulationModel>.from(source);
    result.sort((a, b) => b.population.compareTo(a.population));
    return result;
  }
}

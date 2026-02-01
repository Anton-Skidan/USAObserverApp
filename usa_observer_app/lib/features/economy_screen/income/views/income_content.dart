import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/economy_screen/income/views/income_bar_chart.dart';
import 'package:usa_observer_app/network/economy/income/models/models.dart';

class IncomeContent extends StatelessWidget {
  const IncomeContent({super.key, required this.data});

  final List<IncomeModel> data;

  @override
  Widget build(BuildContext context) {
    final topStates = [...data]
      ..sort((a, b) => b.medianIncome.compareTo(a.medianIncome));

    final top10 = topStates.take(10).toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top 10 States by Median Income (2023)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: IncomeBarChart(data: top10),
          ),
        ],
      ),
    );
  }
}
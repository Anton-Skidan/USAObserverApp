import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/income_screen/views/income_chart_entry.dart';
import 'package:usa_observer_app/features/income_screen/views/income_pie_chart.dart';
import 'package:usa_observer_app/network/economy/income/models/models.dart';

class IncomeContent extends StatelessWidget {
  const IncomeContent({super.key, required this.data});

  final List<IncomeModel> data;

  @override
  Widget build(BuildContext context) {
    final chartData = _buildChartData(context, data);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Top 10 States by Household Count (2023)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
        SizedBox(height: 260, child: IncomePieChart(data: chartData)),
        const SizedBox(height: 32),
        Text('Breakdown', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        ...chartData.map((item) => _LegendTile(entry: item)),
      ],
    );
  }

  List<IncomeChartEntry> _buildChartData(
    BuildContext context,
    List<IncomeModel> source,
  ) {
    final sorted = [...source]
      ..sort((a, b) => b.householdCount.compareTo(a.householdCount));

    final top10 = sorted.take(10).toList();
    final others = sorted.skip(10);

    final otherSum = others.fold<int>(
      0,
      (sum, item) => sum + item.householdCount,
    );

    final palette = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.red,
      Colors.indigo,
      Colors.brown,
      Colors.cyan,
      Colors.pink,
    ];

    final result = <IncomeChartEntry>[
      for (int i = 0; i < top10.length; i++)
        IncomeChartEntry(
          label: top10[i].state,
          value: top10[i].householdCount,
          color: palette[i],
        ),
    ];

    if (otherSum > 0) {
      result.add(
        IncomeChartEntry(
          label: 'Other',
          value: otherSum,
          color: Colors.grey.shade400,
        ),
      );
    }

    return result;
  }
}

class _LegendTile extends StatelessWidget {
  const _LegendTile({required this.entry});

  final IncomeChartEntry entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: entry.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              entry.label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text(
            _formatNumber(entry.value),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
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

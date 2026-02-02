import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:usa_observer_app/features/economy_screen/income/views/income_chart_entry.dart';

class IncomePieChart extends StatelessWidget {
  const IncomePieChart({super.key, required this.data});

  final List<IncomeChartEntry> data;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: List.generate(data.length, (index) {
          final item = data[index];

          return PieChartSectionData(
            value: item.value.toDouble(),
            color: item.color,
            radius: 80,
            title: '',
          );
        }),
        sectionsSpace: 3,
        centerSpaceRadius: 52,
        startDegreeOffset: -90,
      ),
    );
  }
}

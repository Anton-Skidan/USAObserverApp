import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:usa_observer_app/network/economy/income/models/models.dart';

class IncomeBarChart extends StatelessWidget {
  const IncomeBarChart({super.key, required this.data});

  final List<IncomeModel> data;

  @override
  Widget build(BuildContext context) {
    final maxIncome = data.first.medianIncome.toDouble();

    return BarChart(
      BarChartData(
        maxY: maxIncome * 1.1,
        alignment: BarChartAlignment.spaceBetween,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 48,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= data.length) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    data[index].state,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ),
        barGroups: List.generate(data.length, (index) {
          final item = data[index];

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: item.medianIncome.toDouble(),
                width: 18,
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          );
        }),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => Theme.of(context).colorScheme.surface,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final model = data[group.x.toInt()];

              return BarTooltipItem(
                '\$${_formatNumber(model.medianIncome)}',
                Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ),
    );
  }

  String _formatNumber(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();

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

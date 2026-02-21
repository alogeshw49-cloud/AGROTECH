import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/disease_stats.dart';
import '../../../core/theme/app_colors.dart';

class DiseaseChart extends StatelessWidget {
  final List<DiseaseStats> stats;

  const DiseaseChart({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    if (stats.isEmpty) {
      return Container(
        height: 200,
        alignment: Alignment.center,
        child: const Text('No data available to chart'),
      );
    }

    double maxY = stats.map((e) => e.count).reduce((a, b) => a > b ? a : b).toDouble();
    if (maxY == 0) maxY = 10;

    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY + (maxY * 0.2), // Add 20% breathing room
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipPadding: const EdgeInsets.all(8),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${stats[group.x].diseaseName}\n',
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: (rod.toY - 1).toString(),
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ],
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= stats.length) return const SizedBox.shrink();
                  // Truncate long names for the chart x-axis
                  String name = stats[index].diseaseName;
                  if (name.length > 5) name = '${name.substring(0, 5)}..';
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide Y-axis titles for cleaner look
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: maxY / 4,
          ),
          borderData: FlBorderData(show: false),
          barGroups: stats.asMap().entries.map((entry) {
            final index = entry.key;
            final stat = entry.value;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: stat.count.toDouble(),
                  color: AppColors.primaryLight,
                  width: 16,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

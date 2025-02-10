import 'dart:developer';

import 'package:care_nest/features/baby_growth/data/models/get_baby_weight_growth/get_baby_weight_growth_response.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyWeightGrowthChart extends StatelessWidget {
  final List<MeasurementData> userWeights;

  const BabyWeightGrowthChart({super.key, required this.userWeights});

  int getIndexFromAgeCategory(String ageCategory) {
    if (ageCategory.startsWith('month_')) {
      return int.parse(ageCategory.split('_')[1]) - 1;
    } else if (ageCategory.startsWith('year_')) {
      return 12 + int.parse(ageCategory.split('_')[1]) - 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<double> normalWeights = [
      3.85,
      5.1,
      5.475,
      6.375,
      7.1,
      7.675,
      8.1,
      8.725,
      9.05,
      9.65,
      9.9,
      10.1,
      12.625,
      18.25,
    ];

    final List<MeasurementData> validWeights =
        userWeights.where((e) => e.weight != null).toList();

    log('Valid Weights: ${validWeights.map((e) => e.weight).toList()}');

    final List<double?> adjustedWeights = List.filled(12, null);

    for (var weightData in validWeights) {
      int index = getIndexFromAgeCategory(weightData.ageCategory!);
      if (index >= 0 && index < 12) {
        adjustedWeights[index] = weightData.weight!.toDouble();
      }
    }

    log('Adjusted Weights: $adjustedWeights');

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 250.h,
        width: double.infinity,
        child: LineChart(
          LineChartData(
            backgroundColor: Colors.white,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              ),
              getDrawingVerticalLine: (value) => FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              ),
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 3.4,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()} kg',
                      style: const TextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 20,
                  interval: 1.3,
                  getTitlesWidget: (value, meta) {
                    List<String> months = [
                      'M1',
                      'M2',
                      'M3',
                      'M4',
                      'M5',
                      'M6',
                      'M7',
                      'M8',
                      'M9',
                      'M10',
                      'M11',
                      'M12'
                    ];
                    int index = value.toInt();
                    if (index >= 0 && index < months.length) {
                      return Text(months[index],
                          style: const TextStyle(fontSize: 10));
                    }
                    return const Text('');
                  },
                ),
              ),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  normalWeights.length,
                  (index) => FlSpot(index.toDouble(), normalWeights[index]),
                ),
                isCurved: true,
                color: Colors.lightBlueAccent.withOpacity(0.7),
                barWidth: 2,
                isStrokeCapRound: true,
                dashArray: [6, 4],
                belowBarData: BarAreaData(show: false),
                dotData: const FlDotData(show: false),
              ),
              LineChartBarData(
                spots: adjustedWeights
                    .asMap()
                    .entries
                    .where((entry) => entry.value != null)
                    .map((entry) => FlSpot(entry.key.toDouble(), entry.value!))
                    .toList(),
                isCurved: true,
                color: Colors.blue,
                barWidth: 2,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 4.r,
                    color: Colors.green,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

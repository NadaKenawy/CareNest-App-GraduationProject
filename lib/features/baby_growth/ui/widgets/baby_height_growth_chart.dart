// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:care_nest/features/baby_growth/data/models/get_baby_height_growth/get_baby_height_growth_response.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyHeightGrowthChart extends StatelessWidget {
  final List<MeasurementData> userHeights;

  const BabyHeightGrowthChart({super.key, required this.userHeights});

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
    final List<double> normalHeights = [
      53.75,
      57.5,
      60,
      62.5,
      64.5,
      66,
      68.25,
      69.25,
      70.25,
      72.25,
      73.75,
      74.8,
      85.5,
      108,
    ];

    final List<MeasurementData> validHeights =
        userHeights.where((e) => e.height != null).toList();

    log('Valid Heights: ${validHeights.map((e) => e.height).toList()}');

    final List<double?> adjustedHeights = List.filled(12, null);

    for (var heightData in validHeights) {
      int index = getIndexFromAgeCategory(heightData.ageCategory!);
      if (index >= 0 && index < 12) {
        adjustedHeights[index] = heightData.height!.toDouble();
      }
    }

    log('Adjusted Heights: $adjustedHeights');

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
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()} cm',
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
                  normalHeights.length,
                  (index) => FlSpot(index.toDouble(), normalHeights[index]),
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
                spots: adjustedHeights
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

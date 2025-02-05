import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BabyGrowthChart extends StatelessWidget {
  final List<double> userHeights;

  const BabyGrowthChart({super.key, required this.userHeights});

  @override
  Widget build(BuildContext context) {
    final List<double> normalHeights = [
      54,
      58,
      61,
      64,
      66,
      67,
      70,
      72,
      73,
      74,
      75,
      76
    ];

    final List<double> adjustedHeights = List.generate(
      userHeights.length,
      (index) {
        if (index < normalHeights.length) {
          double difference = userHeights[index] - normalHeights[index];
          return normalHeights[index] + (difference / 2);
        }
        return userHeights[index];
      },
    );

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 250,
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
                  getTitlesWidget: (value, meta) {
                    List<String> months = [
                      'Jan',
                      'Feb',
                      'Mar',
                      'Apr',
                      'May',
                      'Jun',
                      'Jul',
                      'Aug',
                      'Sep',
                      'Oct',
                      'Nov',
                      'Dec'
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
                spots: List.generate(
                  adjustedHeights.length,
                  (index) => FlSpot(index.toDouble(), adjustedHeights[index]),
                ),
                isCurved: true,
                color: Colors.blue,
                barWidth: 2,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 4,
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

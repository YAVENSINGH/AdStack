// performance_chart.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Over All Performance\nThe Years',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  LegendItem(color: Colors.pinkAccent, title: 'Pending\nDone'),
                  SizedBox(width: 10),
                  LegendItem(color: Colors.deepPurple, title: 'Project\nDone'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, _) {
                        const style = TextStyle(fontSize: 12);
                        switch (value.toInt()) {
                          case 2015:
                          case 2016:
                          case 2017:
                          case 2018:
                          case 2019:
                          case 2020:
                            return Text(value.toInt().toString(), style: style);
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, interval: 10),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.pinkAccent,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.pinkAccent.withOpacity(0.2),
                    ),
                    dotData: FlDotData(show: false),
                    spots: const [
                      FlSpot(2015, 35),
                      FlSpot(2016, 10),
                      FlSpot(2017, 30),
                      FlSpot(2018, 40),
                      FlSpot(2019, 15),
                      FlSpot(2020, 45),
                    ],
                  ),
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.deepPurple,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                    dotData: FlDotData(show: false),
                    spots: const [
                      FlSpot(2015, 25),
                      FlSpot(2016, 15),
                      FlSpot(2017, 35),
                      FlSpot(2018, 42),
                      FlSpot(2019, 20),
                      FlSpot(2020, 35),
                    ],
                  ),
                ],
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipRoundedRadius: 8,
                    fitInsideVertically: true,
                    fitInsideHorizontally: true,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((touchedSpot) {
                        return LineTooltipItem(
                          '2023\n• ${touchedSpot.y.toInt()}',
                          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String title;

  const LegendItem({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

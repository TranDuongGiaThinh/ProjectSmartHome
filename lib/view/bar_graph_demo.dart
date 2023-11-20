import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarGraphDemo extends StatelessWidget {
  const BarGraphDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 10,
                  width: 25,
                  color: Colors.blue, 
                  borderRadius: BorderRadius.circular(1),

                )
              ]
            ), 
          ],
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            border: const Border(
              left: BorderSide(width: 1.0, color: Colors.blue),
              bottom: BorderSide(width: 1.0, color: Colors.blue),
            ),
          ),  
        ),
      ),
    );
  }
}

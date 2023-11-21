import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../model/Duy_model/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;

  const MyBarGraph(
      {Key? key, required this.weeklySummary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thurAmount: weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    myBarData.initializeBarData();

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 30, 10),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
          BarChartData(
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  getTitlesWidget: getBottomTitles,
                  showTitles: true,
                ),
              ),
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
            barGroups: myBarData.barData
                .map(
                  (data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                        toY: data.y,
                        color: data.color,
                        width: 25,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Sun', style: style);
      break;
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 2:
      text = const Text('Tue', style: style);
      break;
    case 3:
      text = const Text('Wed', style: style);
      break;
    case 4:
      text = const Text('Thu', style: style);
      break;
    case 5:
      text = const Text('Fri', style: style);
      break;
    case 6:
      text = const Text('Sat', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

import 'package:flutter/material.dart';
import 'package:smart_home/view/Duy_view/bar_graph.dart';
import 'date_bar.dart';
import 'dropdown_button_room.dart';
import 'electricity_statistics_month.dart';

class StatisticalScreen extends StatefulWidget {
  const StatisticalScreen({super.key});

  @override
  State<StatisticalScreen> createState() => _StatisticalScreenState();
}

class _StatisticalScreenState extends State<StatisticalScreen> {
  List<double> weeklySummary = [4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: const [
                Text(
                  'Phòng: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                MyDropdownButton()
              ],
            ),
          ),
          const DateSelector(),
          Expanded(
              flex: 3,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('(Watt)'),
                      Expanded(
                        flex: 3,
                        child: MyBarGraph(weeklySummary: weeklySummary),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Số điện sử dụng (trong tuần)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ],
                  ))),
          const Expanded(
            flex: 1,
            child: ElectricityStatisticsMonth(),
          ),
        ],
      ),
    );
  }
}

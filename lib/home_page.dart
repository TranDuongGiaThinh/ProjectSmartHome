import 'package:flutter/material.dart';
import 'package:ui_statistical_page/bar%20graph/bar_graph.dart';
// import 'package:ui_statistical_page/bar%20graph/bar_graph_demo.dart';

// import 'navbar.dart';
import 'date_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> weeklySummary = [4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thống kê'),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 233, 239),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const DateBar(),
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
                        Expanded(
                          flex: 3,
                          child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
                          child:  SizedBox(
                            child: MyBarGraph(weeklySummary: weeklySummary),
                            // child: BarGraphDemo(),
                          ),
                        ),
                        ),
                        const Text(
                          'Số điện sử dụng (trong tuần)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ))),
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Điện tiêu thụ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Tháng này: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Tháng trước: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
              color: Colors.blue,
            ),
            label: 'Thống kê',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
              color: Colors.blue,
            ),
            label: 'Lên lịch',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtherDevices extends StatefulWidget {
  const OtherDevices({Key? key}) : super(key: key);

  @override
  OtherDevicesState createState() => OtherDevicesState();
}

class OtherDevicesState extends State<OtherDevices> {
  List<dynamic> buttons = [];
  Map<String, dynamic> lcd = {};

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/devices.json');
    Map<String, dynamic> data = jsonDecode(jsonData);
    setState(() {
      buttons = data['buttons'];
      lcd = data['LCD'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Các thiết bị khác trong nhà'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Buttons:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(buttons[index]['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chức năng: ${buttons[index]['mission']}'),
                          Text('Nhà sản xuất: ${buttons[index]['producer']}'),
                          Text('Vị trí đặt: ${buttons[index]['location']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'LCD:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tên: ${lcd['name']}'),
                    Text('Chức năng chính: ${lcd['mission']}'),
                    const Text('Chi tiết chức năng: '),
                    Text('1: ${lcd['secon_mission_1']}'),
                    Text('2: ${lcd['secon_mission_2']}'),
                    Text('3: ${lcd['secon_mission_3']}'),
                    Text('Nhà sản xuất: ${lcd['producer']}'),
                    Text('Vị trí đặt: ${lcd['location']}'),
                    Text(
                      'Status: ${lcd['status'] == 0 ? 'Đang tắt' : 'Đang bật'}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

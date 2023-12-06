import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDataScreen extends StatefulWidget {
  const FirebaseDataScreen({Key? key}) : super(key: key);

  @override
  _FirebaseDataScreenState createState() => _FirebaseDataScreenState();
}

class _FirebaseDataScreenState extends State<FirebaseDataScreen> {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Những thiết bị khác',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nút nhấn',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        StreamBuilder(
                          stream: _databaseReference.child('buttons').onValue,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && !snapshot.hasError) {
                              DataSnapshot dataValues = snapshot.data!.snapshot;
                              if (dataValues.value != null) {
                                List<Object?>? buttonList =
                                    dataValues.value as List<Object?>?;
                                buttonList ??= [];
                                return Text(
                                  'Số lượng: ${buttonList.length}',
                                  style: const TextStyle(fontSize: 16),
                                );
                              }
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream: _databaseReference.child('buttons').onValue,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && !snapshot.hasError) {
                          DataSnapshot dataValues = snapshot.data!.snapshot;
                          if (dataValues.value != null) {
                            List<Object?>? buttonList =
                                dataValues.value as List<Object?>?;
                            buttonList ??= [];
                            return Column(
                              children: buttonList.map((button) {
                                Map<dynamic, dynamic> buttonMap =
                                    button as Map<dynamic, dynamic>;
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                                'Tên: ${buttonMap['name']}'),
                                            trailing: Text(
                                                'Vị trí: ${buttonMap['location']}'),
                                          ),
                                          ListTile(
                                            title: Text(
                                                'Nhiệm vụ: ${buttonMap['mission']}'),
                                          ),
                                          ListTile(
                                            title: Text(
                                                'Nhà sản xuất: ${buttonMap['producer']}'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            );
                          }
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 20),
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      'LCD',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    StreamBuilder(
                      stream: _databaseReference.child('LCD').onValue,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && !snapshot.hasError) {
                          DataSnapshot dataValues = snapshot.data!.snapshot;
                          if (dataValues.value != null) {
                            Map<dynamic, dynamic>? lcd =
                                dataValues.value as Map<dynamic, dynamic>?;
                            lcd ??= {};
                            return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(lcd['name']),
                                    subtitle: Text(lcd['mission']),
                                    trailing: Text(lcd['location']),
                                  ),
                                  ListTile(
                                    title: Text(
                                        'Nhà sản xuất: ${lcd['producer']}'),
                                  ),
                                  const Text('Chức năng'),
                                  ListTile(
                                    title: Text(lcd['secon_mission_1']),
                                  ),
                                  ListTile(
                                    title: Text(lcd['secon_mission_2']),
                                  ),
                                  ListTile(
                                    title: Text(lcd['secon_mission_3']),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

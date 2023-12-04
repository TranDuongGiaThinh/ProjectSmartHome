import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kiemtralan2/main.dart';
import 'package:kiemtralan2/models/device.dart';
import 'package:kiemtralan2/viewmodels/device_viewmodel.dart';

// ignore: must_be_immutable
class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key, required this.deviceID});
  final String deviceID;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  late Device device;
  late StreamSubscription _counterSubscription;

  @override
  void dispose() {
    _counterSubscription.cancel();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    device = DeviceViewModel.instance.getDeviceById(widget.deviceID);
    _counterSubscription = FirebaseDatabase.instance
        .ref(DeviceViewModel.instance.getRef(device))
        .onValue
        .listen(_callBack);
  }

  _callBack(DatabaseEvent event) {
    setState(() {});
  }

  _onClickState() {
    setState(() {
      device.state = device.state == 1 ? 0 : 1;
      DeviceViewModel.instance.setStatus(device);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              device.roomName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              textAlign: TextAlign.center,
            )),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                device.name,
                style: const TextStyle(
                    color: Color.fromARGB(255, 192, 183, 183), fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: MyApp.screenWidth * 0.15,
          ),
          Container(
            width: MyApp.screenWidth * 0.85,
            height: MyApp.screenWidth * 0.8,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 193, 190, 190)
                        .withOpacity(0.3), // Màu của đổ bóng
                    spreadRadius: 7, // Độ mở rộng của đổ bóng
                    blurRadius: 7, // Độ mờ của đổ bóng
                    offset: const Offset(
                        0, 3), // Độ dịch chuyển của đổ bóng theo trục x và y
                  ),
                ],
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 212, 212, 212)
                        .withOpacity(0.5)),
                color: const Color.fromARGB(255, 230, 230, 230)),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              const MaterialStatePropertyAll(Size(50, 50)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 230, 230, 230))),
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                  'assets/home/${device.state == 1 ? "greenDot" : "redDot"}.png'),
                            ),
                            Text(
                              device.state == 1 ? '  Đang bật' : '  Đang tắt',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 52, 50, 50),
                                  fontSize: 20),
                            )
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/home/${device.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      '10',
                      style: TextStyle(
                          color: Color.fromARGB(255, 215, 39, 39),
                          fontSize: 90,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: MyApp.screenWidth * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MyApp.screenWidth * 0.13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromWidth(90)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 149, 138, 164))),
                  child: const Text(
                    '+',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromWidth(90)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 149, 138, 164))),
                  child: const Text(
                    '-',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 163, 160, 160)
                              .withOpacity(0.3), // Màu của đổ bóng
                          spreadRadius: 3, // Độ mở rộng của đổ bóng
                          blurRadius: 7, // Độ mờ của đổ bóng
                          offset: const Offset(0,
                              3), // Độ dịch chuyển của đổ bóng theo trục x và y
                        ),
                      ],
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.4))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStatePropertyAll(Size(
                                    MediaQuery.of(context).size.width * 0.15,
                                    MediaQuery.of(context).size.width * 0.15)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                elevation: const MaterialStatePropertyAll(0)),
                            onPressed: () {},
                            child: Image.asset('assets/home/schedule.png')),
                        const Text(
                          'No',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 163, 160, 160)
                              .withOpacity(0.3), // Màu của đổ bóng
                          spreadRadius: 3, // Độ mở rộng của đổ bóng
                          blurRadius: 7, // Độ mờ của đổ bóng
                          offset: const Offset(0,
                              3), // Độ dịch chuyển của đổ bóng theo trục x và y
                        ),
                      ],
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.4))),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: _onClickState,
                    child: Image.asset('assets/home/onoff.png'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 163, 160, 160)
                              .withOpacity(0.3), // Màu của đổ bóng
                          spreadRadius: 3, // Độ mở rộng của đổ bóng
                          blurRadius: 7, // Độ mờ của đổ bóng
                          offset: const Offset(0,
                              3), // Độ dịch chuyển của đổ bóng theo trục x và y
                        ),
                      ],
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.4))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStatePropertyAll(Size(
                                    MediaQuery.of(context).size.width * 0.15,
                                    MediaQuery.of(context).size.width * 0.15)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                elevation: const MaterialStatePropertyAll(0)),
                            onPressed: () {},
                            child: Image.asset('assets/home/chronometer.png')),
                        const Text(
                          '2:00',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

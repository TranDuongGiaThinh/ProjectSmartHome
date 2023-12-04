import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kiemtralan2/viewmodels/device_viewmodel.dart';
import '../../../../models/device.dart';
import '../../screens/device.dart';

class DeviceStautsRoom extends StatefulWidget {
  const DeviceStautsRoom({super.key, required this.deviceId});
  final String deviceId;

  @override
  State<DeviceStautsRoom> createState() => _DeviceStautsRoomState();
}

class _DeviceStautsRoomState extends State<DeviceStautsRoom> {
  final redDot = 'assets/home/redDot.png';
  final greenDot = 'assets/home/greenDot.png';
  // late final double screenWidth;
  late Device device;
  late StreamSubscription _counterSubscription;


  @override
  void initState() {
    device = DeviceViewModel.instance.getDeviceById(widget.deviceId);

    _counterSubscription = FirebaseDatabase.instance
        .ref(DeviceViewModel.instance.getRef(device))
        .onValue
        .listen(_callBack);
    super.initState();
  }

  _onClick() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DeviceScreen(
            deviceID: widget.deviceId,
          ),
        ));
  }

  _callBack(DatabaseEvent event) {
    if (event.snapshot.value != device.state) {
      setState(() {
        device.state = event.snapshot.value! as int;
      });
    }
  }

  _buttonStateClick() {
    setState(() {
      device.state = device.state == 1 ? 0 : 1;
      DeviceViewModel.instance.setStatus(device);
    });
  }

  @override
  void dispose() {
    _counterSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Màu của đổ bóng
              spreadRadius: 2, // Độ mở rộng của đổ bóng
              blurRadius: 7, // Độ mờ của đổ bóng
              offset: const Offset(
                  0, 4), // Độ dịch chuyển của đổ bóng theo trục x và y
            ),
          ],
          border: Border.all(
              color: const Color.fromARGB(255, 208, 208, 208), width: 1),
          color: const Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 7, right: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 169, 167, 167)
                                .withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/home/${device.image}',
                          fit: BoxFit.cover),
                    ),
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(CircleBorder()),
                          elevation: MaterialStatePropertyAll(5),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 230, 230, 230))),
                      onPressed: _buttonStateClick,
                      child: SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset('assets/home/onoff.png')))
                ],
              ),
            ),
            Text(device.name,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 115, 115, 115))),
            Padding(
              padding: const EdgeInsets.only(right: 18, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize:
                            const MaterialStatePropertyAll(Size(50, 30)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        elevation: const MaterialStatePropertyAll(0.5),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 230, 230, 230))),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 14,
                            height: 14,
                            child: Image.asset(
                                device.state == 1 ? greenDot : redDot),
                          ),
                          Text(
                            '  Đang ${device.state == 1 ? 'bật' : 'tắt'}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 135, 134, 134),
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

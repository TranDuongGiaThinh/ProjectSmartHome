import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kiemtralan2/viewmodels/device_viewmodel.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../../../../main.dart';
import '../../../../models/device.dart';
import '../../screens/device.dart';

// ignore: must_be_immutable
class DeviceStatus extends StatefulWidget {
  const DeviceStatus({super.key, required this.deviceId});
  final String deviceId;

  @override
  State<DeviceStatus> createState() => _DeviceStatusState();
}

class _DeviceStatusState extends State<DeviceStatus> {
  late Device device;
  late StreamSubscription _counterSubscription;
  bool isClick = false;

  _onClick() {
    isClick = true;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DeviceScreen(
                  deviceID: device.id,
                )));
  }

  _callBack(DatabaseEvent event) {
    if (event.snapshot.value != device.state || isClick) {
      if (isClick) isClick = false;
      setState(() {
        device.state = event.snapshot.value! as int;
      });
    }
  }

  @override
  void dispose() {
    _counterSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    device = DeviceViewModel.instance.getDeviceById(widget.deviceId);
    _counterSubscription = FirebaseDatabase.instance
        .ref(DeviceViewModel.instance.getRef(device))
        .onValue
        .listen(_callBack);
    super.initState();
  }

  _onStateClick() {
    device.state = device.state == 1 ? 0 : 1;
    DeviceViewModel.instance.setStatus(device);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      child: Container(
        height: MyApp.screenWidth * 0.37,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Màu của đổ bóng
                spreadRadius: 1, // Độ mở rộng của đổ bóng
                blurRadius: 7, // Độ mờ của đổ bóng
                offset: const Offset(
                    0, 3), // Độ dịch chuyển của đổ bóng theo trục x và y
              ),
            ],
            border: Border.all(
                width: 3, color: const Color.fromARGB(255, 208, 208, 208)),
            color: const Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(40)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: MyApp.screenWidth * 0.023),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 193, 190, 190)
                        .withOpacity(0.3), // Màu của đổ bóng
                    spreadRadius: 1, // Độ mở rộng của đổ bóng
                    blurRadius: 7, // Độ mờ của đổ bóng
                    offset: const Offset(
                        0, 3), // Độ dịch chuyển của đổ bóng theo trục x và y
                  ),
                ],
              ),
              height: MyApp.screenWidth * 0.16,
              width: MyApp.screenWidth * 0.16,
              child: Image.asset(
                'assets/home/${device.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MyApp.screenWidth * 0.06,
                      left: MyApp.screenWidth * 0.02),
                  child: Row(children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 230, 230, 230))),
                      onPressed: () {},
                      child: Text("${device.wattage}W/h",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: MyApp.screenWidth * 0.0352,
                              fontWeight: FontWeight.bold)),
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MyApp.screenWidth * 0.04),
                  child: Row(
                    children: [
                      Text(device.name,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 141, 141, 141),
                              fontSize: MyApp.screenWidth * 0.057,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(device.roomName,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 141, 141, 141),
                        fontSize: MyApp.screenWidth * 0.041,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: MyApp.screenWidth * 0.04,
                ),
                LiteRollingSwitch(
                  width: MyApp.screenWidth * 0.258,
                  value: device.state == 1 ? true : false,
                  textOn: 'Bật',
                  textOff: 'Tắt',
                  colorOn: const Color.fromRGBO(56, 142, 60, 1),
                  colorOff: const Color.fromRGBO(213, 0, 0, 1),
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: MyApp.screenWidth * 0.037,
                  onChanged: (bool a) {},
                  onSwipe: () {},
                  onDoubleTap: () {},
                  onTap: _onStateClick,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

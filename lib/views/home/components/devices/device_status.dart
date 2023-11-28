import 'package:flutter/material.dart';
import 'package:kiemtralan2/viewmodels/device_viewmodel.dart';

import '../../../../models/device.dart';
import '../widgets/lite_rolling_switch.dart';
import '../../screens/device.dart';

// ignore: must_be_immutable
class DeviceStatus extends StatefulWidget {
  DeviceStatus({super.key, required this.device});
  late Device device;

  @override
  State<DeviceStatus> createState() => _DeviceStatusState();
}

class _DeviceStatusState extends State<DeviceStatus> {
  _stateChage(bool status) {
    widget.device.state = status;
    DeviceViewModel.instance.setStatus(widget.device).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DeviceScreen(
                      device: Device(pin: "1", state: true),
                    )));
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.35,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(
                width: 3, color: const Color.fromARGB(255, 208, 208, 208)),
            color: const Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(40)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 75,
            width: 75,
            child: Image.asset('assets/home/light.png'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.06),
                  child: Row(children: const [
                    Text('9.9Kwh',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Row(
                    children: const [
                      Text('Đèn',
                          style: TextStyle(
                              color: Color.fromARGB(255, 141, 141, 141),
                              fontSize: 25))
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
                const Text('Phòng ngủ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 141, 141, 141),
                        fontSize: 18)),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                LiteRollingSwitch(
                  width: 90,
                  value: widget.device.state,
                  textOn: 'bật',
                  textOff: 'tắt',
                  colorOn: const Color.fromRGBO(56, 142, 60, 1),
                  colorOff: const Color.fromRGBO(213, 0, 0, 1),
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 16.0,
                  onChanged: _stateChage,
                  onSwipe: () {},
                  onDoubleTap: () {},
                  onTap: () {},
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

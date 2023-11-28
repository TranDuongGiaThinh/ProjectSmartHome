import 'package:flutter/material.dart';
import '../../../../models/device.dart';
import '../../screens/device.dart';

class DeviceStautsRoom extends StatefulWidget {
  const DeviceStautsRoom({super.key});

  @override
  State<DeviceStautsRoom> createState() => _DeviceStautsRoomState();
}

class _DeviceStautsRoomState extends State<DeviceStautsRoom> {
  final redDot = 'assets/home/redDot.png';
  final greenDot = 'assets/home/greenDot.png';
  var state = '';
  var state_Str = '';

  @override
  void initState() {
    state = redDot;
    state_Str = 'tắt';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeviceScreen(
              device: Device(pin: "1", state: true),
            ),
          ),
        )
      },
      child: Container(
        width: 190,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 208, 208, 208), width: 3),
          color: const Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 7, right: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/home/light.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Test Button");
                      // FirebaseDatabase.instance.
                      setState(() => {
                            if (state == redDot)
                              {state = greenDot, state_Str = 'bật'}
                            else
                              {state = redDot, state_Str = 'tắt'}
                          });
                    },
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/home/onoff.png'),
                    ),
                  )
                ],
              ),
            ),
            const Text('Đèn',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 115, 115, 115))),
            Padding(
              padding: const EdgeInsets.only(right: 18, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 13,
                    height: 13,
                    child: Image.asset(state),
                  ),
                  Text(
                    '  Đang $state_Str',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 186, 186, 186)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

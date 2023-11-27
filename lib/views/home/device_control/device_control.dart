import 'package:flutter/material.dart';

class DeviceControlScreen extends StatefulWidget {
  const DeviceControlScreen({super.key});

  @override
  State<DeviceControlScreen> createState() => _DeviceControlScreenState();
}

class _DeviceControlScreenState extends State<DeviceControlScreen> {
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
            const Expanded(
                child: Text(
              'Phòng ngủ',
              style: TextStyle(color: Colors.black),
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
            children: const [
              Text(
                'Đèn',
                style: TextStyle(
                    color: Color.fromARGB(255, 192, 183, 183), fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 3, color: Colors.grey),
                color: const Color.fromARGB(255, 230, 230, 230)),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/home/greenDot.png'),
                    ),
                    const Text(
                      '  Đang bật',
                      style: TextStyle(
                          color: Color.fromARGB(255, 52, 50, 50), fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/home/bulb.png'),
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.13),
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
                          Color.fromARGB(255, 151, 71, 255))),
                  child: const Text(
                    '+',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                          Color.fromARGB(255, 151, 71, 255))),
                  child: const Text(
                    '-',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 3, color: Colors.grey)),
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
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 3, color: Colors.grey)),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    child: Image.asset('assets/home/onoff.png'),
                    onPressed: () => {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 3, color: Colors.grey)),
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

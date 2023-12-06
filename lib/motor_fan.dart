import 'package:flutter/material.dart';

class Morter extends StatefulWidget {
  const Morter({super.key});

  @override
  State<Morter> createState() => _MorterState();
}

class _MorterState extends State<Morter> with SingleTickerProviderStateMixin {
  bool isFanOn = false;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat();
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
                'Quạt',
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
                      child: Image.asset(
                      isFanOn == true ?   'assets/home/greenDot.png':'assets/home/redDot.png'
                        ),
                    ),
                    Text(
                      isFanOn == true ? '  Đang bật' : '  Đang tắt',
                      style: const TextStyle(
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
                    RotationTransition(
                      turns: isFanOn
                          ? _controller
                          : const AlwaysStoppedAnimation(0),
                      child: const Icon(
                        Icons.camera_outlined,
                        size: 130,
                        color: Colors.blue, // Customize the color as needed
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFanOn = !isFanOn;
                            if (isFanOn) {
                              _controller.repeat();
                            } else {
                              _controller.stop();
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Adjust the radius as needed
                          ),
                          fixedSize: const Size(150, 50),
                        ),
                       child: Text(isFanOn ? 'Tắt quạt' : 'Mở quạt',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                     
                    ]))
              
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


 
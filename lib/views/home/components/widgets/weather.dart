import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kiemtralan2/viewmodels/weather_viewmodel.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final forrmatedDate = DateFormat("dd MMM, yyyy").format(DateTime.now());
  int humidity = 0;
  int temp = 0;
  String location = "VietNam";
  String weather = "Door is unlockked";
  String icon = "";

  _refeshWeather() {
    WeatherViewModel.instance.fetchData().then((value) {
      setState(() {
        if (value != null) {
          humidity = value["humidity"];
          location = value["location"];
          temp = value["temp"];
          weather = value["weather"];
          icon = value["icon"];
        }
      });
    });
  }

  @override
  void initState() {
    _refeshWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Màu của đổ bóng
              spreadRadius: 3, // Độ mở rộng của đổ bóng
              blurRadius: 7, // Độ mờ của đổ bóng
              offset: const Offset(
                  0, 3), // Độ dịch chuyển của đổ bóng theo trục x và y
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 171, 88, 236),
              Color.fromARGB(255, 200, 55, 207)
            ],
          ),
          borderRadius: BorderRadius.circular(25)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 225,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 228, 217, 217),
                        size: 18,
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 216, 205, 205),
                            fontSize: 12),
                      )
                    ],
                  ),
                  Text("$forrmatedDate /$temp°C",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  const Text('Độ ẩm',
                      style: TextStyle(fontSize: 23, color: Colors.white)),
                  Text(
                    "$humidity%",
                    style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              const Color.fromARGB(255, 162, 53, 224)
                                  .withOpacity(0.5)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () {},
                      child: Text(
                        weather,
                        style: const TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              child: Stack(fit: StackFit.expand, children: [
            WeatherViewModel.instance.getImage(icon),
            Positioned(
                top: 2,
                right: 2,
                child: IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: _refeshWeather,
                ))
          ])),
        ],
      ),
    );
  }
}

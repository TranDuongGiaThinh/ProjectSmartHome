
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 165, 64, 242),
              Color.fromARGB(255, 231, 85, 238)
            ],
          ),
          borderRadius: BorderRadius.circular(30)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("22 Feb 2023 /25°C",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  const Text("Energy Saving",
                      style: TextStyle(fontSize: 23, color: Colors.white)),
                  const Text(
                    "30%",
                    style: TextStyle(
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
                      child: const Text("Door is unlockked"))
                ],
              ),
            ),
          ),
          Expanded(child: Image.asset('assets/home/weather.png'))
        ],
      ),
    );
  }
}
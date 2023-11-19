import 'package:flutter/material.dart';

class DateBar extends StatelessWidget {
  const DateBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 35,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 229, 233, 239),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(2),
            height: 30,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: IconButton(
              iconSize: 12.0,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: (){},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(2),
            height: 30,
            width: 168,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
          ),
          Container(
            margin: const EdgeInsets.all(2),
            height: 30,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: IconButton(
              iconSize: 12.0,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onPressed: (){},
          ),
          )
        ],
      ),
    );
  }
}

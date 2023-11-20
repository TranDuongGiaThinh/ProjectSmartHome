import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({Key? key}) : super(key: key);

  @override
  MyDropdownButtonState createState() => MyDropdownButtonState();
}

class MyDropdownButtonState extends State<MyDropdownButton> {
  String dropdownValue = 'Tất cả';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 231, 130, 130),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          dropdownColor: Colors.white,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Tất cả', 'Phòng khách', 'Nhà bếp', 'WC', 'Phòng ngủ']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
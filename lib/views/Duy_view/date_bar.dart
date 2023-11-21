import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  DateSelectorState createState() => DateSelectorState();
}

class DateSelectorState extends State<DateSelector> {
  DateTime _firstDateOfWeek = _getFirstDateOfWeek(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 5, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color:const Color.fromARGB(255, 210, 196, 154)),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _firstDateOfWeek = _firstDateOfWeek.subtract(const Duration(days: 7));
              });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color:const Color.fromARGB(255, 210, 196, 154)),
          child: Expanded(
          child: Row(
          
            children: [
              _buildDateWidget(0),
              const Text(" - "),
              _buildDateWidget(6),
            ],
          ),
        ),
        ),
        
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color:const Color.fromARGB(255, 210, 196, 154)),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                _firstDateOfWeek = _firstDateOfWeek.add(const Duration(days: 7));
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDateWidget(int dayOffset) {
    DateTime date = _firstDateOfWeek.add(Duration(days: dayOffset));
    String formattedDate = DateFormat('dd/MM').format(date);
    return Container(
      alignment: Alignment.center,
      child: Text(formattedDate),
    );
  }

  static DateTime _getFirstDateOfWeek(DateTime dateTime) {
    int daysToSubtract = dateTime.weekday - 1;
    return dateTime.subtract(Duration(days: daysToSubtract));
  }
}

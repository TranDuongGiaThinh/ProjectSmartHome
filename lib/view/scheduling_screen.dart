import 'package:flutter/material.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({Key? key}) : super(key: key);

  @override
  _SchedulingScreenState createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  late DateTime selectedDate;
 
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); 
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateString = 'No date selected';
    if (selectedDate != null) {
      dateString = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    }

    return Scaffold(
      
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            GestureDetector(
              onTap: () => _selectDate(context),
              child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 151, 71, 255),
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 const Icon(Icons.date_range_outlined),
                  Text('$dateString',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                 ],
                ),
              ), 
            ) 
          ],
        ),
      ),
    );
  }
}
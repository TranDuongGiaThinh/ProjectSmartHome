import 'package:flutter/material.dart';

class ElectricityStatisticsMonth extends StatelessWidget {
  const ElectricityStatisticsMonth({super.key});

  @override
    Widget build(BuildContext context) {
      return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Điện tiêu thụ',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(height: 8),
              Divider(
                height: 1,
                color: Colors.white,
              ),
              SizedBox(height: 12),
              Text(
                'Tháng này: ',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              SizedBox(height: 8),
              Divider(
                height: 1,
                color: Colors.white,
              ),
              SizedBox(height: 12),
              Text(
                'Tháng trước: ',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ],
          ));
    }
  }


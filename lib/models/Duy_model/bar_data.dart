import 'package:flutter/material.dart';
import 'package:smart_home/model/Duy_model/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunAmount, color: Colors.red),
      IndividualBar(x: 1, y: monAmount, color: Colors.green),
      IndividualBar(x: 2, y: tueAmount, color: Colors.blue),
      IndividualBar(x: 3, y: wedAmount, color: Colors.orange),
      IndividualBar(x: 4, y: thurAmount, color: Colors.purple),
      IndividualBar(x: 5, y: friAmount, color: Colors.yellow),
      IndividualBar(x: 6, y: satAmount, color: Colors.indigo),
    ];
  }
}

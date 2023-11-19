import 'package:flutter/material.dart';
import 'package:ui_statistical_page/home_page.dart';
import 'home_page.dart';
// import 'statistical_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class Constants{
  static const int livingRoom = 0;
  static const int kitchen = 1;
  static const int bedRoom = 2;
  static const int toilet = 3;
  static const List<int> listRoom = [livingRoom, kitchen, bedRoom, toilet];
  
  static const int ledLivingRoom = 0;
  static const int ledKitchen = 1;
  static const int ledBedRoom = 2;
  static const int ledToilet = 3;
  
  static const int fanLivingRoom = 0;
  static const int fanKitchen = 1;
  static const int fanBedRoom = 2;
  static const int fanToilet = 3;
  
  static const int curtainLivingRoom = 0;
  static const int curtainKitchen = 1;
  static const int curtainBedRoom = 2;
  static const int curtainToilet = 3;

  static String avatarDefault = "data/images/avt_default.png";
  static Color colorButton = Colors.blue;
  static Color colorUserBackground = Colors.grey;
  static Color colorLightBackground = const Color.fromARGB(255, 237, 224, 224);
  static Color colorDarkBackground = const Color.fromARGB(255, 32, 19, 100);
  
}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kiemtralan2/config/config.dart';
import 'package:kiemtralan2/viewmodels/device_viewmodel.dart';
import 'package:kiemtralan2/viewmodels/room_viewmodel.dart';
import 'package:kiemtralan2/views/home/screens/home.dart';
import 'data/data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Data.rooms = await RoomViewModel.instance.getRooms();
  Data.devices = await DeviceViewModel.instance.getDevices();

  await AppConfig.getJson();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static late double screenWidth;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Plus',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_home/presenter/setting_presenter.dart';
import 'package:smart_home/view/index_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = SettingPresenter.setting.themeModeLight ? ThemeMode.light : ThemeMode.dark;

  reloadThemeMode() {
    setState(() {
      themeMode = SettingPresenter.setting.themeModeLight ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: IndexScreen(idUser: -1, reloadThemeMode: reloadThemeMode),
    );
  }
}

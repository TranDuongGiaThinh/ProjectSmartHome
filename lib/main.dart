import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/info_reader.dart';
import 'package:smart_home/models/setting.dart';
import 'package:smart_home/presenters/firebase_presenter.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/presenters/setting_presenter.dart';
import 'package:smart_home/views/home/home.dart';
import 'package:smart_home/views/login_screen.dart';
import 'package:smart_home/views/sign_up_screen.dart';

void main() async {
  await FirebasePresenter.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InfoReader infoReader = InfoReader();
  ThemeMode themeMode = SettingPresenter.setting.themeModeLight
      ? ThemeMode.light
      : ThemeMode.dark;

  @override
  void initState() {
    super.initState();

    loadSetting();
  }

  reloadThemeMode() {
    setState(() {
      themeMode = SettingPresenter.setting.themeModeLight
          ? ThemeMode.light
          : ThemeMode.dark;

      LanguagePresenter.updateLanguage();
    });
  }

  Future<void> loadSetting() async {
    String str = await infoReader.getStringJsonSetting();
    if (str.isNotEmpty) {
      SettingPresenter.setting = Setting.fromJson(jsonDecode(str));
      reloadThemeMode();
    } else {
      infoReader.saveSetting();
      reloadThemeMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LanguagePresenter.language.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Constants.colorLightBackground,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Constants.colorDarkBackground,
      ),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/login": (context) => LoginScreen(reloadThemeMode: reloadThemeMode),
        "/signUp": (context) => const SignUpScreen(),
        "/": (context) => IndexScreen(reloadThemeMode: reloadThemeMode)
      },
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/info_reader.dart';
import 'package:smart_home/models/setting.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/presenters/firebase_presenter.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/presenters/setting_presenter.dart';
import 'package:smart_home/presenters/user_presenter.dart';
import 'package:smart_home/views/index_screen.dart';
import 'package:smart_home/views/login_screen.dart';
import 'package:smart_home/views/sign_up_screen.dart';

void main() async {
  await FirebasePresenter.initialize();
  User user = User();
  user.password = "0000";
  UserPresenter.addUser(user);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    String str = await InfoReader().getStringJsonSetting();
    if (str.isNotEmpty) {
      SettingPresenter.setting = Setting.fromJson(jsonDecode(str));
      reloadThemeMode();
    } else {
      InfoReader().saveSetting();
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
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginScreen(reloadThemeMode: reloadThemeMode),
        "/signUp": (context) => const SignUpScreen(),
        "/": (context) => IndexScreen(reloadThemeMode: reloadThemeMode)
      },
    );
  }
}

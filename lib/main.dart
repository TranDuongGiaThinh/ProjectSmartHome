import 'dart:convert';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/Utils/Utils.dart';
import 'package:smart_home/models/constants.dart';
import 'package:smart_home/models/info_reader.dart';
import 'package:smart_home/models/setting.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/presenters/setting_presenter.dart';
import 'package:smart_home/views/login.dart/login_screen.dart';
import 'package:smart_home/views/main/main_screen.dart';
import 'package:smart_home/views/signup_screen/sign_up_screen.dart';
import 'package:smart_home/views/index_screen.dart';

Future main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
   // Initialize App Check


}
final navigatorKey=GlobalKey<NavigatorState>();
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
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
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
      initialRoute: "/main_screen",
      routes: {
        "/main_screen": (context) =>const Main(),
        "/ login_screen":(context)=> const LoginScreen(),
        "/signUp": (context) => const SignUpScreen(),
        "/": (context) => IndexScreen(reloadThemeMode: reloadThemeMode),

      },
    );
  }
}

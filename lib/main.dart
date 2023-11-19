import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/model/info_reader.dart';
import 'package:smart_home/model/setting.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/setting_presenter.dart';
import 'package:smart_home/view/index_screen.dart';
import 'package:smart_home/view/login_screen.dart';


void createCollection() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    // ignore: avoid_print
    print('error in Firebase.initializeApp(): $e');
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Tên collection bạn muốn tạo
  String collectionName = 'users';

  // Kiểm tra xem collection đã tồn tại chưa
  bool isCollectionExist = await firestore
      .collection(collectionName)
      .get()
      .then((value) => value.docs.isNotEmpty);

  // Nếu chưa tồn tại, thì tạo mới
  if (isCollectionExist) {
    // ignore: avoid_print
    print('Collection already exists.');
  } else {
    // ignore: avoid_print
    print('Collection does not exist!');
  }
}

void main() async {
  createCollection();

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
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home:const LoginSCreen(),
    );
  }
}
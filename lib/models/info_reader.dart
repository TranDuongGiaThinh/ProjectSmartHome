import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smart_home/presenters/setting_presenter.dart';

class InfoReader{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //setting
  Future<File> get _localFileSetting async {
    final path = await _localPath;
    return File('$path/setting.json');
  }

  Future<String> getStringJsonSetting() async {
    String s = "";
    try {
      final localFile = await _localFileSetting;
      s = await localFile.readAsString();
    } catch (e) {
      // ignore: avoid_print
      print("getStringJsonSetting() error: $e");
    }
    return s;
  }

  Future<File> saveSetting() async {
    final localFile = await _localFileSetting;
    return await localFile.writeAsString(jsonEncode(SettingPresenter.setting.toJson()).toString());
  }

  //token
  
}
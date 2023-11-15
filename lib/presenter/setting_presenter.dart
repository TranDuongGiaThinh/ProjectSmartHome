import 'package:smart_home/model/setting.dart';

class SettingPresenter {
  static Setting setting = Setting();

  static changeLanguage(){
    setting.changeLanguage();
  }
}
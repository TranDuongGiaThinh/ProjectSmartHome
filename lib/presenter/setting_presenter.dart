import 'package:smart_home/model/setting.dart';

class SettingPresenter {
  static Setting setting = Setting();

  static changeLanguage(){
    setting.changeLanguage();
  }

  static changeThemeMode(){
    setting.themeModeLight = !setting.themeModeLight;
  }
}
import 'package:smart_home/model/info_reader.dart';
import 'package:smart_home/model/setting.dart';

class SettingPresenter {
  static Setting setting = Setting();

  static Future<void> changeThemeMode() async {
    setting.themeModeLight = !setting.themeModeLight;
    await InfoReader().saveSetting();
  }

  static Future<void> changeLanguage() async {
    setting.changeLanguage();
    await InfoReader().saveSetting();
  }
}

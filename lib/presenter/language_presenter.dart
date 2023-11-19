import 'package:smart_home/model/language.dart';
import 'package:smart_home/presenter/setting_presenter.dart';

class LanguagePresenter {
  static Language language = Language(SettingPresenter.setting.language);

  static updateLanguage(){
    language = Language(SettingPresenter.setting.language);
  }
}
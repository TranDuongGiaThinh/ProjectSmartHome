import 'package:smart_home/models/language.dart';
import 'package:smart_home/presenters/setting_presenter.dart';

class LanguagePresenter {
  static Language language = Language(SettingPresenter.setting.language);

  static updateLanguage(){
    language = Language(SettingPresenter.setting.language);
  }
}
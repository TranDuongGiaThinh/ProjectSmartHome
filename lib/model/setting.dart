class Setting {
  late bool themeModeLight;
  late String language;

  Setting(){
    themeModeLight = true;
    language = "vi";
  }

  changeThemeMode(){
    themeModeLight = !themeModeLight;
  }

  changeLanguage(){
    language == "vi" ? language = "en" : language = "vi";
  }
}
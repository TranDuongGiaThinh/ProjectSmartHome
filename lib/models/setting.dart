class Setting {
  late bool themeModeLight;
  late String language;

  Setting() {
    themeModeLight = true;
    language = "vi";
  }

  Setting.fromJson(Map<String, dynamic> json) {
    themeModeLight = json["themeModeLight"];
    language = json["language"];
  }

  Map<String, dynamic> toJson() =>
      {"themeModeLight": themeModeLight, "language": language};

  changeThemeMode() {
    themeModeLight = !themeModeLight;
  }

  changeLanguage() {
    language == "vi" ? language = "en" : language = "vi";
  }
}

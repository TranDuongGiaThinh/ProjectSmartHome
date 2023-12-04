import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  static late Map<String, dynamic> josn;

  static Future<void> getJson() async {
    const path = "lib/config/config.json";
    final data = await rootBundle.loadString(path);
    josn = await jsonDecode(data);
  }
}

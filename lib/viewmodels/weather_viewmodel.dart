import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:kiemtralan2/config/config.dart';

class WeatherViewModel {
  static WeatherViewModel? _instance;

  WeatherViewModel._();

  // design pattern singleton
  static WeatherViewModel get instance {
    _instance ??= WeatherViewModel._();
    return _instance!;
  }

  Image getImage(String iconId) => iconId == ""
      ? Image.asset("assets/home/weather.png", fit: BoxFit.cover)
      : Image.network("https://openweathermap.org/img/wn/$iconId.png",
          fit: BoxFit.cover);

  Future<Map<String, dynamic>?> fetchData() async {
    dynamic configWeather = AppConfig.josn["weather"];
    Position position = Position(
      // default HCM
      longitude: 106.7009,
      latitude: 10.7769,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      floor: null,
      isMocked: false,
    );

    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      if (kDebugMode) {
        print("Unable to get location");
      }
    }

    String url = configWeather["api_url"];
    url = url
        .replaceAll('{apikey}', configWeather["api_key"])
        .replaceAll('{latitude}', position.latitude.toString())
        .replaceAll('{longitude}', position.longitude.toString());

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      List<dynamic> weatherList = data['weather'];
      var firstWeather = weatherList.first;

      return {
        //example API: https://openweathermap.org/current#list
        "humidity": data["main"]["humidity"],
        "temp": (data["main"]["temp"] - 273.5).toInt(), // Kelvin to C
        "location": data["name"],
        "weather": firstWeather['description'],
        "icon": firstWeather["icon"]
      };
    } else {
      return null;
    }
  }
}

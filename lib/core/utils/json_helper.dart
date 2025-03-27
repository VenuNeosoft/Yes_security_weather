import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/models/weather_model.dart';

class JsonHelper {
  static Future<List<Weather>> loadWeatherData() async {
    final String data = await rootBundle.loadString('assets/weather_data.json');
    final Map<String, dynamic> jsonData = json.decode(data);
    final List<dynamic> weatherList = jsonData['consolidated_weather'];
    return weatherList.map((e) => Weather.fromJson(e)).toList();
  }
}

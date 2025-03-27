import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();
  factory PreferencesService() => _instance;

  PreferencesService._internal();

  static const String _temperatureUnitKey = 'temperature_unit';

  Future<bool> getTemperatureUnit() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      bool? unit = prefs.getBool(_temperatureUnitKey);
      return unit ?? false;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading temperature unit: $e');
      }
      return false;
    }
  }

  Future<void> setTemperatureUnit(bool isFahrenheit) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_temperatureUnitKey, isFahrenheit);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving temperature unit: $e');
      }
    }
  }
}

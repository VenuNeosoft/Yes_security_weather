import '../models/weather_model.dart';
import '../../core/utils/json_helper.dart';

class WeatherRepository {
  Future<List<Weather>> fetchWeatherData() async {
    return await JsonHelper.loadWeatherData();
  }
}

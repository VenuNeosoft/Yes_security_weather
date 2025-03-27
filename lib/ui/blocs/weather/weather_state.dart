import 'package:equatable/equatable.dart';
import '../../../data/models/weather_model.dart';

enum TemperatureUnit { celsius, fahrenheit }

class WeatherState extends Equatable {
  final List<Weather> weatherData;
  final List<Weather> originalWeatherData;
  final TemperatureUnit temperatureUnit;

  const WeatherState({
    this.weatherData = const [],
    this.originalWeatherData = const [],
    this.temperatureUnit = TemperatureUnit.celsius,
  });

  WeatherState copyWith({
    List<Weather>? weatherData,
    List<Weather>? originalWeatherData,
    TemperatureUnit? temperatureUnit,
  }) {
    return WeatherState(
      weatherData: weatherData ?? this.weatherData,
      originalWeatherData: originalWeatherData ?? this.originalWeatherData,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
    );
  }

  @override
  List<Object?> get props =>
      [weatherData, originalWeatherData, temperatureUnit];
}

import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class Weather {
  final int id;
  final String weatherStateName;
  final String weatherType;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String applicableDate;

  Weather({
    required this.id,
    required this.weatherStateName,
    required this.weatherType,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.applicableDate,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    var weather = _$WeatherFromJson(json);
    return Weather(
      id: weather.id,
      weatherStateName: weather.weatherStateName,
      weatherType: weather.weatherType,
      minTemp: weather.minTemp,
      maxTemp: weather.maxTemp,
      theTemp: weather.theTemp,
      applicableDate: weather.applicableDate,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

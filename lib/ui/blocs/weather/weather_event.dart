import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadWeather extends WeatherEvent {}

class SearchCity extends WeatherEvent {
  final String query;

  SearchCity(this.query);

  @override
  List<Object> get props => [query];
}

class ClearSearchResults extends WeatherEvent {}

class ToggleTemperatureUnit extends WeatherEvent {}

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/services/preferences_service.dart';
import '../../../data/repository/weather_repository.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(const WeatherState()) {
    on<LoadWeather>(_onLoadWeather);
    on<SearchCity>(_onSearchCity);
    on<ToggleTemperatureUnit>(_onToggleTemperatureUnit);
    on<ClearSearchResults>(_onClearSearchResults);
  }
  void _onClearSearchResults(
      ClearSearchResults event, Emitter<WeatherState> emit) {
    emit(state.copyWith(weatherData: state.originalWeatherData));
  }

  void _onLoadWeather(LoadWeather event, Emitter<WeatherState> emit) async {
    final weatherData = await weatherRepository.fetchWeatherData();
    emit(state.copyWith(
      weatherData: weatherData,
      originalWeatherData: weatherData,
    ));
  }

  void _onSearchCity(SearchCity event, Emitter<WeatherState> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(weatherData: state.originalWeatherData));
      return;
    }

    final query = event.query.toLowerCase();
    final filteredData = state.originalWeatherData.where((weather) {
      return weather.weatherStateName.toLowerCase().contains(query);
    }).toList();

    emit(state.copyWith(weatherData: filteredData));
  }

  void _onToggleTemperatureUnit(
      ToggleTemperatureUnit event, Emitter<WeatherState> emit) async {
    bool isFahrenheit = state.temperatureUnit == TemperatureUnit.celsius;

    await PreferencesService().setTemperatureUnit(isFahrenheit);

    emit(state.copyWith(
      temperatureUnit:
          isFahrenheit ? TemperatureUnit.fahrenheit : TemperatureUnit.celsius,
    ));
  }

  @override
  void onTransition(Transition<WeatherEvent, WeatherState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print('Transition: $transition');
    }
  }
}

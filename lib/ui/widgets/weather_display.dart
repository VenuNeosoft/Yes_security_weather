import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/ui/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/blocs/weather/weather_state.dart';
import 'package:weather_app/core/constants/color_manager.dart';
import 'package:weather_app/core/utils/weather_utils.dart';

class WeatherDisplay extends StatelessWidget {
  final double temp;
  final String condition;
  final String min;
  final String max;
  final String type;

  const WeatherDisplay({
    super.key,
    required this.temp,
    required this.condition,
    required this.min,
    required this.max,
    required this.type,
  });

  // Convert Celsius to Fahrenheit
  double _convertToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  @override
  Widget build(BuildContext context) {
    final weatherDetails = getWeatherDetails(temp);

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        bool isFahrenheit = state.temperatureUnit == TemperatureUnit.fahrenheit;

        double displayedTemp = isFahrenheit ? _convertToFahrenheit(temp) : temp;
        double displayedMin = isFahrenheit
            ? _convertToFahrenheit(double.parse(min))
            : double.parse(min);
        double displayedMax = isFahrenheit
            ? _convertToFahrenheit(double.parse(max))
            : double.parse(max);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    weatherDetails['icon'],
                    size: 40,
                    color: ColorManager.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      ' ${displayedTemp.toInt()}° ${isFahrenheit ? 'F' : 'C'}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Max: ${displayedMax.toInt()}° ${isFahrenheit ? 'F' : 'C'}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Min: ${displayedMin.toInt()}° ${isFahrenheit ? 'F' : 'C'}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              type,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }
}

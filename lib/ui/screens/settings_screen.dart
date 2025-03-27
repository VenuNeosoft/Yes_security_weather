import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/blocs/weather/weather_event.dart';
import 'package:weather_app/ui/blocs/weather/weather_state.dart';

import '../../core/constants/color_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.lightRainAppBar,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          bool isFahrenheit =
              state.temperatureUnit == TemperatureUnit.fahrenheit;

          return Card(
            color: ColorManager.white,
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SwitchListTile(
              value: isFahrenheit,
              onChanged: (value) {
                context.read<WeatherBloc>().add(ToggleTemperatureUnit());
              },
              activeColor: ColorManager.lightRain2,
              title: const Text(
                'Temperature Unit',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              subtitle: const Text(
                'Use metric measurements for temperature units.',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          );
        },
      ),
    );
  }
}

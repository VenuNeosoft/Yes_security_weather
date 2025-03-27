import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/blocs/weather/weather_event.dart';
import '../blocs/weather/weather_bloc.dart';
import '../../core/constants/color_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final weatherData = context.read<WeatherBloc>().state.weatherData;

    final filteredCities = weatherData
        .where((weather) => weather.weatherStateName
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightRainAppBar,
        title: const Text(
          'Search City',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search City...',
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final weather = filteredCities[index];
                return ListTile(
                  title: Text(
                    weather.weatherStateName,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  onTap: () {
                    query = '';
                    context.read<WeatherBloc>().add(ClearSearchResults());
                    Navigator.pop(context, weather.weatherStateName);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/color_manager.dart';
import 'package:weather_app/ui/widgets/weather_display.dart';
import '../blocs/weather/weather_bloc.dart';
import '../blocs/weather/weather_event.dart';
import '../blocs/weather/weather_state.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/gradient_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? lastUpdatedTime;

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(SearchCity('India'));
    updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Weather'),
            backgroundColor: state.weatherData.isEmpty
                ? ColorManager.thunderAppBar
                : getAppBarColor(state.weatherData.first.theTemp),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  context.read<WeatherBloc>().add(ClearSearchResults());
                  final String? selectedCity =
                      await Navigator.pushNamed(context, '/search') as String?;
                  if (selectedCity != null) {
                    // ignore: use_build_context_synchronously
                    context.read<WeatherBloc>().add(SearchCity(selectedCity));
                    updateTime();
                  }
                },
              ),
            ],
          ),
          body: state.weatherData.isEmpty
              ? const Center(child: Text('No weather data available!'))
              : Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: getTemperatureGradient(
                      state.weatherData.first.theTemp,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(state.weatherData.first.weatherStateName,
                          style: Theme.of(context).textTheme.displayLarge),
                      const SizedBox(height: 10),
                      Text('Updated: ${formatDateTime(lastUpdatedTime)}'),
                      const SizedBox(height: 50),
                      WeatherDisplay(
                        temp: state.weatherData.first.theTemp,
                        condition: state.weatherData.first.weatherStateName,
                        min: '${state.weatherData.first.minTemp.toInt()}',
                        max: '${state.weatherData.first.maxTemp.toInt()}',
                        type: state.weatherData.first.weatherType,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
        );
      },
    );
  }

  void updateTime() {
    setState(() {
      lastUpdatedTime = DateTime.now();
    });
  }
}

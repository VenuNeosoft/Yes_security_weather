import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theme/app_theme.dart';
import 'package:weather_app/ui/screens/search_screen.dart';
import 'package:weather_app/ui/screens/settings_screen.dart';
import 'ui/blocs/weather/weather_bloc.dart';
import 'ui/blocs/weather/weather_event.dart';
import 'data/repository/weather_repository.dart';
import 'ui/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository = WeatherRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(weatherRepository: weatherRepository)
            ..add(LoadWeather()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Weather',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/search': (context) => const SearchScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}

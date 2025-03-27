import 'package:flutter/material.dart';

Map<String, dynamic> getWeatherDetails(double temp) {
  IconData icon;
  if (temp < 0) {
    icon = Icons.cloud;
  } else if (temp >= 0 && temp <= 12) {
    icon = Icons.cloudy_snowing;
  } else if (temp > 12 && temp <= 25) {
    icon = Icons.cloud_queue;
  } else {
    icon = Icons.wb_sunny_sharp;
  }

  return {
    'icon': icon,
  };
}

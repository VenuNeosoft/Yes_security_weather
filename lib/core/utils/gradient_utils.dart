import 'package:flutter/material.dart';
import '../constants/color_manager.dart';

Gradient getTemperatureGradient(double temp) {
  if (temp < 0) {
    return const LinearGradient(
      colors: [ColorManager.thunder1, ColorManager.thunder3],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.6, 0.9],
    );
  } else if (temp >= 0 && temp <= 12) {
    return const LinearGradient(
      colors: [ColorManager.lightRain1, ColorManager.lightRain2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.6, 0.9],
    );
  } else if (temp > 12 && temp <= 25) {
    return const LinearGradient(
      colors: [ColorManager.snow1, ColorManager.snow2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.6, 0.9],
    );
  } else {
    return const LinearGradient(
      colors: [ColorManager.cloud1, ColorManager.cloud2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.6, 0.9],
    );
  }
}

Color getAppBarColor(double temp) {
  if (temp < 0) {
    return ColorManager.thunderAppBar;
  } else if (temp >= 0 && temp <= 12) {
    return ColorManager.lightRainAppBar;
  } else if (temp > 12 && temp <= 25) {
    return ColorManager.snowAppBar;
  } else {
    return ColorManager.cloudAppBar;
  }
}

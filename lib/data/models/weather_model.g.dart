// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: (json['id'] as num).toInt(),
      weatherStateName: json['weatherStateName'] as String,
      weatherType: json['weatherType'] as String,
      minTemp: (json['minTemp'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      theTemp: (json['theTemp'] as num).toDouble(),
      applicableDate: json['applicableDate'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'weatherStateName': instance.weatherStateName,
      'weatherType': instance.weatherType,
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'theTemp': instance.theTemp,
      'applicableDate': instance.applicableDate,
    };

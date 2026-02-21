// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_risk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherRisk _$WeatherRiskFromJson(Map<String, dynamic> json) => _WeatherRisk(
  riskLevel: json['riskLevel'] as String,
  advice: json['advice'] as String,
  temperature: (json['temperature'] as num).toDouble(),
  humidity: (json['humidity'] as num).toDouble(),
);

Map<String, dynamic> _$WeatherRiskToJson(_WeatherRisk instance) =>
    <String, dynamic>{
      'riskLevel': instance.riskLevel,
      'advice': instance.advice,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    };

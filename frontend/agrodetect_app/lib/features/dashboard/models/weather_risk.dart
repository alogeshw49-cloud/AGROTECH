import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_risk.freezed.dart';
part 'weather_risk.g.dart';

@freezed
abstract class WeatherRisk with _$WeatherRisk {
  
  const factory WeatherRisk({
    required String riskLevel, // Low, Moderate, High
    required String advice,
    required double temperature,
    required double humidity,
  }) = _WeatherRisk;

  factory WeatherRisk.fromJson(Map<String, dynamic> json) => _$WeatherRiskFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/weather_risk.dart';
import '../models/disease_stats.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  
  const factory DashboardState({
    @Default(true) bool isLoading,
    WeatherRisk? weatherRisk,
    @Default([]) List<DiseaseStats> diseaseStats,
    String? error,
  }) = _DashboardState;
}

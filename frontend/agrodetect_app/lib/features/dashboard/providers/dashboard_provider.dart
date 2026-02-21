import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../models/weather_risk.dart';
import '../models/disease_stats.dart';
import 'dashboard_state.dart';

final dashboardProvider = NotifierProvider<DashboardNotifier, DashboardState>(DashboardNotifier.new);

class DashboardNotifier extends Notifier<DashboardState> {
  late final ApiClient _apiClient;

  @override
  DashboardState build() {
    _apiClient = ref.watch(apiClientProvider);
    Future.microtask(() => fetchDashboardData());
    return const DashboardState();
  }

  Future<void> fetchDashboardData() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // Run both API requests concurrently
      final responses = await Future.wait([
        _apiClient.get(ApiEndpoints.weatherRisk, queryParameters: {'lat': 28.61, 'lon': 77.20}), // Mock coords for now
        _apiClient.get('${ApiEndpoints.history}/stats'), // Let's pretend this endpoint exists for stats
      ]);

      final weatherData = WeatherRisk.fromJson(responses[0].data);
      
      final statsList = (responses[1].data as List)
          .map((e) => DiseaseStats.fromJson(e))
          .toList();

      state = state.copyWith(
        isLoading: false,
        weatherRisk: weatherData,
        diseaseStats: statsList,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

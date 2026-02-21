class ApiEndpoints {
  // Auth
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';

  // AI Scan
  static const String predict = '/predict';

  // History
  static const String history = '/history';
  static String deleteHistory(int id) => '/history/$id';

  // Dashboard & Profile
  static const String weatherRisk = '/weather-risk';
  static const String profile = '/profile';
}

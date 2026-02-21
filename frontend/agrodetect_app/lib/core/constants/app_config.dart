class AppConfig {
  static const String environment = String.fromEnvironment('ENV', defaultValue: 'dev');
  
  static String get baseUrl {
    switch (environment) {
      case 'prod':
        return 'https://api.agrodetect.com/api/v1';
      case 'staging':
        return 'https://staging-api.agrodetect.com/api/v1';
      case 'dev':
      default:
        // Using common emulator localhost equivalent (10.0.2.2 for Android)
        return 'http://10.0.2.2:8000/api/v1';
    }
  }
}

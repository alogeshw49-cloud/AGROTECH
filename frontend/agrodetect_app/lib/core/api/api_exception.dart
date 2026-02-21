class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? code;
  final dynamic errors;

  ApiException({
    required this.message,
    this.statusCode,
    this.code,
    this.errors,
  });

  @override
  String toString() {
    return 'ApiException: $message (statusCode: $statusCode, code: $code)';
  }
}

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../services/secure_storage_service.dart';
import 'api_exception.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _secureStorageService;

  AuthInterceptor(this._secureStorageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorageService.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n'
      'DATA: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n'
      'MESSAGE: ${err.message}',
    );
    super.onError(err, handler);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = 'An unexpected error occurred';
    String? code;
    dynamic errors;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      message = 'Please check your internet connection';
    } else if (err.response != null) {
      final data = err.response!.data;
      if (data is Map<String, dynamic>) {
        if (data.containsKey('detail')) {
          final detail = data['detail'];
          if (detail is Map) {
            code = detail['code']?.toString();
            message = detail['message']?.toString() ?? message;
          } else if (detail is String) {
            message = detail;
          } else if (detail is List && detail.isNotEmpty) {
            // e.g., FastAPI validation errors
            message = detail.first['msg']?.toString() ?? 'Validation Error';
            errors = detail;
          }
        }
      } else {
        message = 'Server error: ${err.response?.statusCode}';
      }
    }

    final exception = ApiException(
      message: message,
      statusCode: err.response?.statusCode,
      code: code,
      errors: errors,
    );

    // Attach custom exception to DioException
    err = err.copyWith(error: exception);
    super.onError(err, handler);
  }
}

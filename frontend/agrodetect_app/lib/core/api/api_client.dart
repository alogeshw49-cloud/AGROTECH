import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_config.dart';
import '../services/secure_storage_service.dart';
import 'api_interceptors.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final secureStorage = ref.read(secureStorageProvider);
  return ApiClient(secureStorage);
});

class ApiClient {
  late final Dio dio;
  final SecureStorageService _secureStorageService;

  ApiClient(this._secureStorageService) {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: Headers.jsonContentType,
      ),
    );

    // Add generic interceptors
    dio.interceptors.addAll([
      AuthInterceptor(_secureStorageService),
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);

    // Add Retry interceptor
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // Use standard print or logger here
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
        retryEvaluator: (error, attempt) {
          // Retry on connection errors or 5xx server errors
          return error.type == DioExceptionType.connectionError ||
              error.type == DioExceptionType.connectionTimeout ||
              (error.response != null && error.response!.statusCode! >= 500);
        },
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await dio.put(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    return await dio.delete(path, queryParameters: queryParameters);
  }
}

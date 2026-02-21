import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../../../core/services/secure_storage_service.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/user.dart';
import 'auth_state.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  late final ApiClient _apiClient;
  late final SecureStorageService _secureStorage;

  @override
  AuthState build() {
    _apiClient = ref.watch(apiClientProvider);
    _secureStorage = ref.watch(secureStorageProvider);
    return const AuthState.initial();
  }

  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();
    try {
      final token = await _secureStorage.getAccessToken();
      if (token == null) {
        state = const AuthState.unauthenticated();
        return;
      }
      
      // Verify token by fetching profile
      final response = await _apiClient.get(ApiEndpoints.profile);
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        state = AuthState.authenticated(user);
      } else {
        await logout();
      }
    } catch (e) {
      // Token might be expired or network error
      // TODO: Handle refresh token logic explicitly here if interceptor doesn't
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: request.toJson(),
      );

      final authResponse = AuthResponse.fromJson(response.data);
      await _secureStorage.saveAccessToken(authResponse.accessToken);
      await _secureStorage.saveRefreshToken(authResponse.refreshToken);
      
      state = AuthState.authenticated(authResponse.user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> register(String name, String email, String password) async {
    state = const AuthState.loading();
    try {
      final response = await _apiClient.post(
        ApiEndpoints.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      final authResponse = AuthResponse.fromJson(response.data);
      await _secureStorage.saveAccessToken(authResponse.accessToken);
      await _secureStorage.saveRefreshToken(authResponse.refreshToken);
      
      state = AuthState.authenticated(authResponse.user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    await _secureStorage.clearAll();
    state = const AuthState.unauthenticated();
  }
}

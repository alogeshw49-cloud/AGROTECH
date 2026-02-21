import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../models/profile.dart';
import 'profile_state.dart';

final profileProvider = NotifierProvider<ProfileNotifier, ProfileState>(ProfileNotifier.new);

class ProfileNotifier extends Notifier<ProfileState> {
  late final ApiClient _apiClient;

  @override
  ProfileState build() {
    _apiClient = ref.watch(apiClientProvider);
    Future.microtask(() => fetchProfile());
    return const ProfileState();
  }

  Future<void> fetchProfile() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _apiClient.get(ApiEndpoints.profile);
      final profile = Profile.fromJson(response.data);
      state = state.copyWith(isLoading: false, profile: profile);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateProfile({required String name, required String language}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _apiClient.put(
        ApiEndpoints.profile,
        data: {'name': name, 'language': language},
      );
      final updatedProfile = Profile.fromJson(response.data['user'] ?? response.data);
      state = state.copyWith(isLoading: false, profile: updatedProfile);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

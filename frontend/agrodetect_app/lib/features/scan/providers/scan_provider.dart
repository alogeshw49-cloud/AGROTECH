import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../models/prediction_result.dart';
import 'scan_state.dart';

final scanProvider = NotifierProvider<ScanNotifier, ScanState>(ScanNotifier.new);

class ScanNotifier extends Notifier<ScanState> {
  late final ApiClient _apiClient;

  @override
  ScanState build() {
    _apiClient = ref.watch(apiClientProvider);
    return const ScanState.idle();
  }

  Future<void> scanImage(XFile image) async {
    state = const ScanState.loading(0.0);
    try {
      String fileName = image.path.split('/').last;
      
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
      });

      final response = await _apiClient.post(
        ApiEndpoints.predict,
        data: formData,
      ).onError((error, stackTrace) {
        throw error!;
      });

      final result = PredictionResult.fromJson(response.data);
      state = ScanState.success(result);
      
    } catch (e) {
      state = ScanState.error(e.toString());
    }
  }

  void reset() {
    state = const ScanState.idle();
  }
}

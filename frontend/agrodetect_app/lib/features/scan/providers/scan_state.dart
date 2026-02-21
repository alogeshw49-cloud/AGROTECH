import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/prediction_result.dart';

part 'scan_state.freezed.dart';

@freezed
abstract class ScanState with _$ScanState {
  
  const factory ScanState.idle() = _Idle;
  const factory ScanState.loading(double progress) = _Loading;
  const factory ScanState.success(PredictionResult result) = _Success;
  const factory ScanState.error(String message) = _Error;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'prediction_result.freezed.dart';
part 'prediction_result.g.dart';

@freezed
abstract class PredictionResult with _$PredictionResult {
  
  const factory PredictionResult({
    required String diseaseName,
    required double confidence,
    required String severity,
    required String remedy,
    required String prevention,
  }) = _PredictionResult;

  factory PredictionResult.fromJson(Map<String, dynamic> json) => _$PredictionResultFromJson(json);
}

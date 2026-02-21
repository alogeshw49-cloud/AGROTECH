// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PredictionResult _$PredictionResultFromJson(Map<String, dynamic> json) =>
    _PredictionResult(
      diseaseName: json['diseaseName'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      severity: json['severity'] as String,
      remedy: json['remedy'] as String,
      prevention: json['prevention'] as String,
    );

Map<String, dynamic> _$PredictionResultToJson(_PredictionResult instance) =>
    <String, dynamic>{
      'diseaseName': instance.diseaseName,
      'confidence': instance.confidence,
      'severity': instance.severity,
      'remedy': instance.remedy,
      'prevention': instance.prevention,
    };

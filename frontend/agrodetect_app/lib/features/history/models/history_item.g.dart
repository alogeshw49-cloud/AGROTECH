// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) => _HistoryItem(
  id: (json['id'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  diseaseName: json['diseaseName'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  severity: json['severity'] as String,
  remedy: json['remedy'] as String,
  prevention: json['prevention'] as String,
  scanDate: DateTime.parse(json['scanDate'] as String),
);

Map<String, dynamic> _$HistoryItemToJson(_HistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'diseaseName': instance.diseaseName,
      'confidence': instance.confidence,
      'severity': instance.severity,
      'remedy': instance.remedy,
      'prevention': instance.prevention,
      'scanDate': instance.scanDate.toIso8601String(),
    };

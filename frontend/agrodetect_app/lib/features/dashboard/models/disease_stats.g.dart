// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiseaseStats _$DiseaseStatsFromJson(Map<String, dynamic> json) =>
    _DiseaseStats(
      diseaseName: json['diseaseName'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$DiseaseStatsToJson(_DiseaseStats instance) =>
    <String, dynamic>{
      'diseaseName': instance.diseaseName,
      'count': instance.count,
    };

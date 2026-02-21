import 'package:freezed_annotation/freezed_annotation.dart';

part 'disease_stats.freezed.dart';
part 'disease_stats.g.dart';

@freezed
abstract class DiseaseStats with _$DiseaseStats {
  
  const factory DiseaseStats({
    required String diseaseName,
    required int count,
  }) = _DiseaseStats;

  factory DiseaseStats.fromJson(Map<String, dynamic> json) => _$DiseaseStatsFromJson(json);
}

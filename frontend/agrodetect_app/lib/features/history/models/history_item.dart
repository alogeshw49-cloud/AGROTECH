import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_item.freezed.dart';
part 'history_item.g.dart';

@freezed
abstract class HistoryItem with _$HistoryItem {
  
  const factory HistoryItem({
    required int id,
    required String imageUrl,
    required String diseaseName,
    required double confidence,
    required String severity,
    required String remedy,
    required String prevention,
    required DateTime scanDate,
  }) = _HistoryItem;

  factory HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/history_item.dart';

part 'history_state.freezed.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  
  const factory HistoryState({
    @Default([]) List<HistoryItem> items,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    @Default(1) int page,
    String? error,
  }) = _HistoryState;
}

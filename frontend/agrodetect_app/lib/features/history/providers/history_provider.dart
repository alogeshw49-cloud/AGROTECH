import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../models/history_item.dart';
import 'history_state.dart';

final historyProvider = NotifierProvider<HistoryNotifier, HistoryState>(HistoryNotifier.new);

class HistoryNotifier extends Notifier<HistoryState> {
  late final ApiClient _apiClient;
  static const int _limit = 10;

  @override
  HistoryState build() {
    _apiClient = ref.watch(apiClientProvider);
    Future.microtask(() => fetchHistory(refresh: true));
    return const HistoryState();
  }

  Future<void> fetchHistory({bool refresh = false}) async {
    if (state.isLoading) return;
    if (refresh) {
      state = const HistoryState(isLoading: true);
    } else {
      if (!state.hasMore) return;
      state = state.copyWith(isLoading: true);
    }

    try {
      final response = await _apiClient.get(
        ApiEndpoints.history,
        queryParameters: {
          'page': state.page,
          'limit': _limit,
        },
      );

      final List<dynamic> data = response.data['items'];
      final List<HistoryItem> newItems = data.map((e) => HistoryItem.fromJson(e)).toList();
      final bool hasMore = response.data['next'] != null;

      state = state.copyWith(
        items: refresh ? newItems : [...state.items, ...newItems],
        hasMore: hasMore,
        page: hasMore ? state.page + 1 : state.page,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> deleteHistoryItem(int id) async {
    // Optimistic UI update
    final previousItems = state.items;
    state = state.copyWith(
      items: state.items.where((item) => item.id != id).toList(),
    );

    try {
      await _apiClient.delete(ApiEndpoints.deleteHistory(id));
    } catch (e) {
      // Revert on failure
      state = state.copyWith(items: previousItems, error: 'Failed to delete item: ${e.toString()}');
    }
  }
}

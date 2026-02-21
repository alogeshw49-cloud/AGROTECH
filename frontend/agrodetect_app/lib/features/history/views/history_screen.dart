import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:agrodetect_app/localization/app_localizations.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/error_widget.dart';
import '../providers/history_provider.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Fetch more if we are near the bottom of the list
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(historyProvider.notifier).fetchHistory();
    }
  }

  Future<void> _onRefresh() async {
    await ref.read(historyProvider.notifier).fetchHistory(refresh: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyState = ref.watch(historyProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.history,
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: historyState.error != null && historyState.items.isEmpty
          ? ErrorWidgetDisplay(
              message: historyState.error!,
              onRetry: () => ref.read(historyProvider.notifier).fetchHistory(refresh: true),
            )
          : historyState.isLoading && historyState.items.isEmpty
              ? const LoadingWidget()
              : historyState.items.isEmpty
                  ? _buildEmptyState(context, l10n)
                  : RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: historyState.items.length + (historyState.hasMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == historyState.items.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          final item = historyState.items[index];
                          return HistoryCard(
                            item: item,
                            onTap: () => context.push('/history/detail', extra: item),
                            onDelete: () {
                              ref.read(historyProvider.notifier).deleteHistoryItem(item.id);
                            },
                          );
                        },
                      ),
                    ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_toggle_off, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No scan history found',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/scan'),
            child: Text(l10n.scanPlant),
          ),
        ],
      ),
    );
  }
}

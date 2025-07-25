import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/coin_model.dart';
import '../services/coin_api_service.dart';

class CoinNotifier extends StateNotifier<List<Coin>> {
  final CoinApiService _service;
  Timer? _timer;

  CoinNotifier(this._service) : super([]) {
    _fetchCoins(); // Initial fetch
    _startAutoRefresh(); // Auto fetch every 30 seconds
  }

  // Private fetch method
  Future<void> _fetchCoins() async {
    try {
      final coins = await _service.fetchTopGainers();
      state = coins;
    } catch (e) {
      print("Error fetching coins: $e");
    }
  }

  // Public method to allow manual refresh (used in pull-to-refresh)
  Future<void> refresh() async {
    await _fetchCoins();
  }

  // Starts periodic refresh
  void _startAutoRefresh() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _fetchCoins());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/coin_model.dart';
import '../services/coin_api_service.dart';
import 'coin_notifier.dart';

// Provide the API service
final coinApiServiceProvider = Provider<CoinApiService>((ref) {
  return CoinApiService();
});

// Provide the CoinNotifier
final topCoinsProvider = StateNotifierProvider<CoinNotifier, List<Coin>>((ref) {
  final apiService = ref.read(coinApiServiceProvider);
  return CoinNotifier(apiService);
});

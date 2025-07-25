import 'dart:async';
import '../models/coin_model.dart';
import '../notification/notification_service.dart';
import '../services/coin_api_service.dart';

class PriceMonitorService {
  final CoinApiService apiService;
  List<Coin>? _previousCoins;

  PriceMonitorService({required this.apiService});

  void startMonitoring() {
    Timer.periodic(const Duration(hours: 1), (timer) async {
      try {
        final currentCoins = await apiService.fetchTopGainers();

        if (_previousCoins != null) {
          for (int i = 0; i < currentCoins.length; i++) {
            final old = _previousCoins![i];
            final newCoin = currentCoins[i];

            final double diff =
                ((newCoin.currentPrice - old.currentPrice) / old.currentPrice) *
                100;

            if (diff.abs() >= 5) {
              final direction = diff > 0 ? 'increased' : 'decreased';
              await NotificationService.showNotification(
                title: '${newCoin.name} Alert!',
                body:
                    '${newCoin.name} has $direction by ${diff.toStringAsFixed(2)}%',
              );
            }
          }
        }

        _previousCoins = currentCoins;
      } catch (e) {
        print('Error during background monitoring: $e');
      }
    });
  }
}

import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../models/coin_model.dart';
import '../services/coin_api_service.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Timer? _timer;
  static final Map<String, double> _lastPrices = {};

  static Future<void> initialize() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'price_alert_channel',
          'Price Alerts',
          channelDescription: 'Notifies when price changes significantly',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(0, title, body, notificationDetails);
  }

  static void startPriceChangeChecker(CoinApiService apiService) {
    _timer?.cancel(); // Prevent duplicate timers

    _timer = Timer.periodic(Duration(seconds: 5), (_) async {
      try {
        final coins = await apiService.fetchTopGainers();

        for (var coin in coins) {
          final currentPrice = coin.currentPrice;

          if (_lastPrices.containsKey(coin.id)) {
            final oldPrice = _lastPrices[coin.id]!;
            final priceChange = ((currentPrice - oldPrice) / oldPrice) * 100;

            if (priceChange.abs() >= 5) {
              await showNotification(
                title: '${coin.name} price alert!',
                body:
                    '${coin.name} has changed by ${priceChange.toStringAsFixed(2)}%',
              );
            }
          }

          _lastPrices[coin.id] = currentPrice;
        }
      } catch (e) {
        print("Error checking price changes: $e");
      }
    });
  }

  static void stopPriceChecker() {
    _timer?.cancel();
    _timer = null;
  }
}

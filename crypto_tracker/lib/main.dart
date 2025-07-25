import 'package:crypto_tracker/models/coin_model.dart';
import 'package:crypto_tracker/notification/notification_service.dart';
import 'package:crypto_tracker/screens/home_screen.dart';
import 'package:crypto_tracker/services/coin_api_service.dart';
import 'package:crypto_tracker/services/price_monitor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CoinAdapter());

  await NotificationService.initialize();
  final apiService = CoinApiService();
  final monitorService = PriceMonitorService(apiService: apiService);
  NotificationService.startPriceChangeChecker(apiService);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

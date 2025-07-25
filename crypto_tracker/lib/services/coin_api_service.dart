import 'package:dio/dio.dart';
import '../models/coin_model.dart';
import 'package:hive/hive.dart';
import '../models/top_gainers_response.dart';

class CoinApiService {
  final Dio _dio;
  CoinApiService({Dio? dio})
    : _dio =
          dio ?? Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3'));
  final String _coinBoxName = 'coinBox';
  Future<List<Coin>> fetchTopGainers() async {
    try {
      final response = await _dio.get(
        '/coins/markets',
        queryParameters: {
          'vs_currency': 'usd',
          'order': 'market_cap_desc',
          'per_page': 10,
          'page': 1,
        },
      );
      final coins = (response.data as List)
          .map((json) => Coin.fromJson(json))
          .toList();
      //Open hive box and catch results
      final box = await Hive.openBox<Coin>(_coinBoxName);
      await box.clear();
      await box.addAll(coins);

      return coins;
    } catch (e) {
      print('API error : $e');

      //on error , return coin if available
      final box = await Hive.openBox<Coin>(_coinBoxName);
      final cachedCoins = box.values.toList();

      if (cachedCoins.isNotEmpty) {
        print("Returning cached coins");
        return cachedCoins;
      }
      throw Exception("Failed to load top Gianers and no cache available : $e");
    }
  }

  Future<List<double>> fetchPriceChart(String coinId, int days) async {
    try {
      final response = await _dio.get(
        '/coins/$coinId/market_chart',
        queryParameters: {'vs_currency': 'usd', 'days': days.toString()},
      );

      final List prices = response.data['prices'];
      return prices.map<double>((point) => point[1] as double).toList();
    } catch (e) {
      throw Exception('Failed to fetch Chart');
    }
  }
}

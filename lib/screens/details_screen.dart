import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/coin_model.dart';
import '../services/coin_api_service.dart';

class DetailScreen extends StatefulWidget {
  final Coin coin;
  const DetailScreen({Key? key, required this.coin}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<FlSpot> _priceSpots = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchChartData();
  }

  Future<void> _fetchChartData() async {
    try {
      final prices = await CoinApiService().fetchPriceChart(widget.coin.id, 7);
      setState(() {
        _priceSpots = prices.asMap().entries.map((entry) {
          final index = entry.key;
          final price = entry.value;
          return FlSpot(index.toDouble(), price);
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      print("Chart error: $e");
      setState(() => _isLoading = false);
    }
  }

  Widget _buildChart() {
    return LineChart(
      LineChartData(
        minY: _priceSpots.map((e) => e.y).reduce((a, b) => a < b ? a : b),
        maxY: _priceSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                '\$${value.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(left: BorderSide(), bottom: BorderSide()),
        ),
        gridData: FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: _priceSpots,
            barWidth: 2,
            color: Colors.blue,
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final coin = widget.coin;

    return Scaffold(
      appBar: AppBar(title: Text(coin.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(coin.image, height: 80, width: 80),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailTile(
                      'Market Cap',
                      '\$${coin.marketCap.toStringAsFixed(2)}',
                    ),
                    _buildDetailTile(
                      '24h High',
                      '\$${coin.high24h.toStringAsFixed(2)}',
                    ),
                    _buildDetailTile(
                      '24h Low',
                      '\$${coin.low24h.toStringAsFixed(2)}',
                    ),
                    _buildDetailTile(
                      'Total Supply',
                      coin.totalSupply?.toStringAsFixed(0) ?? 'N/A',
                    ),
                    _buildDetailTile(
                      'Volume (24h)',
                      '\$${coin.totalVolume.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      '7-Day Price Chart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AspectRatio(
                      aspectRatio: 1.7,
                      child: _priceSpots.isNotEmpty
                          ? _buildChart()
                          : const Text("No data"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

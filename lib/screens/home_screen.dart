import 'package:crypto_tracker/components/text_widget.dart';
import 'package:crypto_tracker/providers/coin_provider.dart';
import 'package:crypto_tracker/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crypto_tracker/components/text_widget.dart';
import 'package:crypto_tracker/providers/coin_provider.dart';
import 'package:crypto_tracker/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coins = ref.watch(topCoinsProvider); // List<Coin>
    final notifier = ref.read(topCoinsProvider.notifier); // CoinNotifier

    return Scaffold(
      appBar: _appBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await notifier.refresh(); // Call refresh method on notifier
        },
        child: coins.isEmpty
            ? ListView(
                children: [
                  SizedBox(height: 300),
                  Center(child: CircularProgressIndicator()),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    final coin = coins[index];
                    final isPositive = coin.priceChangePercentage24h >= 0;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(coin.image),
                      ),
                      title: TextWidget(label: coin.name, textSize: 15),
                      subtitle: TextWidget(
                        label: coin.symbol.toUpperCase(),
                        textSize: 15,
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            label: '\$${coin.currentPrice.toStringAsFixed(2)}',
                            textSize: 15,
                          ),
                          TextWidget(
                            label:
                                '${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
                            textSize: 15,
                            textColor: isPositive ? Colors.green : Colors.red,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(coin: coin),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(title: TextWidget(label: "Crypto Tracker"));
  }
}

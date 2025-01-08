import 'package:clean_architecture/feature/quotes/presentation/controller/notifier/quotes_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotesList extends ConsumerWidget {
  const QuotesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qlist = ref.watch(getQuotesNotifierProvider);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: qlist.when(
          data: (data) => _buildQuotesList(data),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text("Error: $error")),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Quotes List",
        style: TextStyle(
          fontSize: 35,
          fontFamily: "sans-serif",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.purple.shade400,
    );
  }

  Widget _buildQuotesList(data) {
    if (data.quotes.isEmpty) {
      return const Center(child: Text("No Records found"));
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.quotes.length,
            itemBuilder: (BuildContext context, index) {
              final quote = data.quotes[index].quote ?? 'No Quote';
              return _buildQuoteCard(quote);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuoteCard(String quote) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.greenAccent.shade100,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            quote,
            style: const TextStyle(
              fontSize: 26,
              fontFamily: "sans-serif",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
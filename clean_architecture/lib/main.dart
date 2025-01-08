
import 'package:clean_architecture/feature/quotes/presentation/pages/quotes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp(const ProviderScope( child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: QuotesList(),
    );
  }
}


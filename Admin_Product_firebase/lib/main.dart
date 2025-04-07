import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/feature/login/login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/router/app_router.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
options: FirebaseOptions(
    apiKey: "AIzaSyDcY6pKqJRYEGIg28ujoKRfRNtTa-53xgY",
    appId: "1:385898670255:web:62dd67b3f078bb905a8c5a",
    messagingSenderId: "385898670255",
    projectId:"admin-jc")
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}

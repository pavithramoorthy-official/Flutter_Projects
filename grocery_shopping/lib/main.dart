import 'package:firebase_core/firebase_core.dart';
import 'package:grocery_shopping/aboutus.dart';
import 'package:grocery_shopping/fetech_screen.dart';
import 'package:grocery_shopping/inner_screens/disclaimer.dart';
import 'package:grocery_shopping/providers/orders_providers.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_shopping/Auth/forget_password.dart';
import 'package:grocery_shopping/Auth/login_screen.dart';
import 'package:grocery_shopping/Auth/signup.dart';
import 'package:grocery_shopping/constants/theme_data.dart';
import 'package:grocery_shopping/inner_screens/category_screen.dart';
import 'package:grocery_shopping/inner_screens/feed_screen.dart';
import 'package:grocery_shopping/inner_screens/onsale_screen.dart';
import 'package:grocery_shopping/inner_screens/product_details.dart';
import 'package:grocery_shopping/provider/dark_theme_provider.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/providers/viewed_providers.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
import 'package:grocery_shopping/screens/bottom_bar.dart';
import 'package:grocery_shopping/screens/home_screen.dart';
import 'package:grocery_shopping/screens/orders/order_screen.dart';
import 'package:grocery_shopping/screens/viewed/viewed_screen.dart';
import 'package:grocery_shopping/screens/wishlist/wishlist_screen.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkThemeProvider =
        await themeChangeProvider.darkThemePreference.getThemePreference();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  final Future<FirebaseApp> _fireobj =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fireobj,
        builder: (context, snapsht) {
          if (snapsht.hasError) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Text("Some error Occured !!!"),
                ),
              ),
            );
          } else if (snapsht.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return themeChangeProvider;
              }),
              ChangeNotifierProvider(
                create: (_) => ProductProviders(),
              ),
              ChangeNotifierProvider(
                create: (_) => CartProviders(),
              ),
              ChangeNotifierProvider(
                create: (_) => WishlistProviders(),
              ),
              ChangeNotifierProvider(
                create: (_) => ViewedProviders(),
              ),
              ChangeNotifierProvider(
                create: (_) => OrdersProviders(),
              ),
            ],
            //instead of initializing the provider for whole file we do it for one widget - consumer
            child: Consumer<DarkThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: Styles.themedata(themeProvider.getDarkTheme, context),
                  home: const FetchScreen(),
                  routes: {
                    OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
                    FeedScreen.routeName: (ctx) => const FeedScreen(),
                    ProductDetails.routeName: (ctx) => const ProductDetails(),
                    WishlistScreen.routeName: (ctx) => const WishlistScreen(),
                    OrderScreen.routeName: (ctx) => const OrderScreen(),
                    ViewedRecentlyScreen.routeName: (ctx) =>
                        const ViewedRecentlyScreen(),
                    HomeScreen.routeName: (ctx) => const HomeScreen(),
                    BottomBarScreen.routeName: (ctx) => const BottomBarScreen(),
                    LoginScreen.routeName: (ctx) => const LoginScreen(),
                    SignUp.routeName: (ctx) => const SignUp(),
                    ForgotPassword.routeName: (ctx) => const ForgotPassword(),
                    CategoryScreen.routeName: (ctx) => const CategoryScreen(),
                    AboutUs.routeName: (ctx) => const AboutUs(),
                    DisclaimerPage.routeName: (ctx) => const DisclaimerPage()
                  });
            }),
          );
        });
  }
}

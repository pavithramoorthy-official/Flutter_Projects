import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/constants/const_lists.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/orders_providers.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
import 'package:grocery_shopping/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  List<String> imagesToShowOnStartScreen = ConstList.offerImages;
  @override
  void initState() {
    imagesToShowOnStartScreen.shuffle();
    Future.delayed(const Duration(microseconds: 5), () async {
      final productsProviders =
          Provider.of<ProductProviders>(context, listen: false);
      final cartProviders = Provider.of<CartProviders>(context, listen: false);
      final wishListProviders =
          Provider.of<WishlistProviders>(context, listen: false);
      final ordersProviders =
          Provider.of<OrdersProviders>(context, listen: false);
      final User? user = firebaseAuthObject.currentUser;
      if (user == null) {
        await productsProviders.fetchProductsFromFirebase();
        cartProviders.clearLocalCart();
        wishListProviders.clearLocalWishlist();
      } else {
        await productsProviders.fetchProductsFromFirebase();
        await cartProviders.fetchCart();
        await wishListProviders.fetchWishList();
        //await ordersProviders.fetchOrderFromFirebase();
      }

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const BottomBarScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imagesToShowOnStartScreen[0],
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: Colors.cyanAccent,
            ),
          ),
        ],
      ),
    );
  }
}

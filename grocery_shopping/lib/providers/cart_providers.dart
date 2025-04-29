import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/models/cart_model.dart';

class CartProviders with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  // void addProductsToCart({
  //   required String productId,
  //   required int quantity,
  // }) {
  //   _cartItems.putIfAbsent(
  //     productId,
  //     () => CartModel(
  //       id: DateTime.now().toString(),
  //       productId: productId,
  //       quantity: quantity,
  //     ),
  //   );
  //   notifyListeners();
  // }

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> fetchCart() async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    final User? user = firebaseAuthObject.currentUser;
    final DocumentSnapshot userDoc = await userCollection.doc(user!.uid).get();
    if (userDoc == null) {
      return;
    }
    final len = userDoc.get('userCartItems').length;
    for (int i = 0; i < len; i++) {
      _cartItems.putIfAbsent(
          userDoc.get('userCartItems')[i]['productId'],
          () => CartModel(
              id: userDoc.get('userCartItems')[i]['cartId'],
              productId: userDoc.get('userCartItems')[i]['productId'],
              quantity: userDoc.get('userCartItems')[i]['quantity']));
    }
    notifyListeners();
  }

  void reduceQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: productId,
        quantity: value.quantity - 1,
      ),
    );
    notifyListeners();
  }

  void increaseQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: productId,
        quantity: value.quantity + 1,
      ),
    );
    notifyListeners();
  }

  Future<void> removeOneItem({
    required String cartId,
    required String productId,
    required int quantity,
  }) async {
    final User? user = firebaseAuthObject.currentUser;
    await userCollection.doc(user!.uid).update({
      'userCartItems': FieldValue.arrayRemove([
        {
          'cartId': cartId,
          'productId': productId,
          'quantity': quantity,
        }
      ])
    });
    _cartItems.remove(productId);
    await fetchCart();
    notifyListeners();
  }

  Future<void> clearOnlineCart() async {
    final User? user = firebaseAuthObject.currentUser;
    await userCollection.doc(user!.uid).update({
      'userCartItems': [],
    });
    _cartItems.clear();
    notifyListeners();
  }

  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

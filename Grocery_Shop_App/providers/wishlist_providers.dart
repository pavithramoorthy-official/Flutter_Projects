import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/models/wishlist_model.dart';

class WishlistProviders with ChangeNotifier {
  Map<String, WishlistModel> _wishlistItems = {};

  Map<String, WishlistModel> get getWishlistItems {
    return _wishlistItems;
  }

  final userCollection = FirebaseFirestore.instance.collection('users');
  // Future<void> fetchWishList() async {
  //   final User? user = firebaseAuthObject.currentUser;
  //   final DocumentSnapshot userDoc = await userCollection.doc(user!.uid).get();
  //   if (userDoc == null) {
  //     return;
  //   }
  //   final len = userDoc.get('userWishList').length;
  //   for (int i = 0; i < len; i++) {
  //     _wishlistItems.putIfAbsent(
  //         userDoc.get('userWishList')[i]['productId'],
  //         () => WishlistModel(
  //               id: userDoc.get('userWishList')[i]['wishListId'],
  //               productId: userDoc.get('userWishList')[i]['productId'],
  //             ));
  //   }
  //   notifyListeners();
  // }

  // Future<void> removeOneItem({
  //   required String wishListId,
  //   required String productId,
  // }) async {
  //   final User? user = firebaseAuthObject.currentUser;
  //   await userCollection.doc(user!.uid).update({
  //     'userWishList': FieldValue.arrayRemove([
  //       {
  //         'wishListId': wishListId,
  //         'productId': productId,
  //       }
  //     ])
  //   });
  //   _wishlistItems.remove(productId);
  //   await fetchWishList();
  //   notifyListeners();
  // }

  // Future<void> clearOnlineWishList() async {
  //   final User? user = firebaseAuthObject.currentUser;
  //   await userCollection.doc(user!.uid).update({
  //     'userWishList': [],
  //   });
  //   _wishlistItems.clear();
  //   notifyListeners();
  // }

  void clearLocalWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }

  void addProductToWishlist({required String productId}) {
    if (_wishlistItems.containsKey(productId)) {
      removeOneWishlistItem(productId);
    } else {
      _wishlistItems.putIfAbsent(
        productId,
        () => WishlistModel(
          id: DateTime.now().toString(),
          productId: productId,
        ),
      );
    }
    notifyListeners();
  }

  void removeOneWishlistItem(String productId) {
    _wishlistItems.remove(productId);
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/models/viewed_model.dart';

class ViewedProviders with ChangeNotifier {
  Map<String, ViewedModel> _viewedItemsList = {};

  Map<String, ViewedModel> get getViewedItemsList {
    return _viewedItemsList;
  }

  void addViewedItemToHistory({required String productId}) {
    _viewedItemsList.putIfAbsent(
      productId,
      () => ViewedModel(
        id: DateTime.now().toString(),
        productId: productId,
      ),
    );
    notifyListeners();
  }

  // void clearOnlineCart() async {
  //   final userCollection = FirebaseFirestore.instance.collection('users');
  //   final User? user = firebaseAuthObject.currentUser;
  //   await userCollection.doc(user!.uid).update({
  //     'userCartItems': [],
  //   });
  //   _viewedItemsList.clear();
  //   notifyListeners();
  // }

  void clearHistory() {
    _viewedItemsList.clear();
    notifyListeners();
  }
}

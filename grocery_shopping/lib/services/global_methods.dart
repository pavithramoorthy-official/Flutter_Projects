import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:uuid/uuid.dart';

class GlobalMethods {
  static navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialogue({
    required String title,
    required String subtitle,
    required Function fcn,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  fcn();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Ok",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        }));
  }

  static Future<void> errorDialogue({
    required String subtitle,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text(
              "An Error has occurred",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Ok",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        }));
  }

  static Future<void> addToCart(
      {required String productId,
      required int quantity,
      required BuildContext context}) async {
    final User? user = firebaseAuthObject.currentUser;
    final _uid = user!.uid;
    final cartId = const Uuid().v4();
    try {
      FirebaseFirestore.instance.collection('users').doc(_uid).update({
        'userCartItems': FieldValue.arrayUnion([
          {
            'cartId': cartId,
            'productId': productId,
            'quantity': quantity,
          }
        ])
      });
      await Fluttertoast.showToast(
        msg: "Product added to cart successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } catch (error) {
      errorDialogue(subtitle: error.toString(), context: context);
    }
  }

  static Future<void> addToWishList({
    required String productId,
    required BuildContext context,
  }) async {
    final User? user = firebaseAuthObject.currentUser;
    final _uid = user!.uid;
    final wishListId = const Uuid().v4();
    try {
      FirebaseFirestore.instance.collection('users').doc(_uid).update({
        'userWishList': FieldValue.arrayUnion([
          {
            'wishListId': wishListId,
            'productId': productId,
          }
        ])
      });
      await Fluttertoast.showToast(
        msg: "Product added to Wishlists successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (error) {
      errorDialogue(subtitle: error.toString(), context: context);
    }
  }
}

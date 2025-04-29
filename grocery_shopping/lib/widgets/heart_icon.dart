import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:provider/provider.dart';

class HeartIconWidget extends StatefulWidget {
  HeartIconWidget({
    super.key,
    required this.productId,
    this.isInWishlist = false,
  });
  final String productId;
  final bool? isInWishlist;

  @override
  State<HeartIconWidget> createState() => _HeartIconWidgetState();
}

class _HeartIconWidgetState extends State<HeartIconWidget> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Color color = Utilities(context).color;
    final productProviders = Provider.of<ProductProviders>(context);
    final getCurrentProduct =
        productProviders.findProductbyId(widget.productId);
    final wishlistProvidersObject = Provider.of<WishlistProviders>(context);

    return GestureDetector(
      onTap: () async {
        setState(() {
          loading = true;
        });
        try {
          final User? user = firebaseAuthObject.currentUser;
          if (user == null) {
            GlobalMethods.errorDialogue(
                subtitle: "Please Login to Continue", context: context);
            return;
          }
          if (widget.isInWishlist == false && widget.isInWishlist != null) {
            await GlobalMethods.addToWishList(
                productId: widget.productId, context: context);
          } else {
            await wishlistProvidersObject.removeOneItem(
                wishListId: wishlistProvidersObject
                    .getWishlistItems[getCurrentProduct.id]!.id,
                productId: widget.productId);
          }
          await wishlistProvidersObject.fetchWishList();
          setState(() {
            loading = false;
          });
          //wishlistProvidersObject.addProductToWishlist(productId: productId);
        } catch (error) {
          GlobalMethods.errorDialogue(subtitle: '$error', context: context);
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
      child: loading
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 10, width: 10, child: CircularProgressIndicator()),
            )
          : Icon(
              widget.isInWishlist != null && widget.isInWishlist == true
                  ? IconlyBold.heart
                  : IconlyLight.heart,
              size: 22,
              color: widget.isInWishlist != null && widget.isInWishlist == true
                  ? Colors.red
                  : color,
            ),
    );
  }
}

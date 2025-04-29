// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/inner_screens/product_details.dart';
import 'package:grocery_shopping/models/product_model.dart';
import 'package:grocery_shopping/models/wishlist_model.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/heart_icon.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Utilities(context).getTheme;
    Color color = Utilities(context).color;
    Size size = Utilities(context).getScreenSize;
    final productProvidersObject = Provider.of<ProductProviders>(context);
    final wishlistProvidersObject = Provider.of<WishlistProviders>(context);
    final wishlistModelObject = Provider.of<WishlistModel>(context);

    final getCurrentProduct =
        productProvidersObject.findProductbyId(wishlistModelObject.productId);
    final productPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;
    bool? _isInWishlist = wishlistProvidersObject.getWishlistItems
        .containsKey(getCurrentProduct.id);

    // final productModelobj = Provider.of<ProductModel>(context);
    // final cartProvidersobj = Provider.of<CartProviders>(context);
    // bool isInCart =
    //     cartProvidersobj.getCartItems.containsKey(productModelobj.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName,
              arguments: wishlistModelObject.productId);
          // GlobalMethods.navigateTo(
          //     ctx: context, routeName: ProductDetails.routeName);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade600),
            color: theme
                ? const Color(0xFF0a0d2c)
                : Colors.white, //Theme.of(context).cardColor.withOpacity(0.5),

            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  // width: size.width * 0.2,
                  height: size.width * 0.25,
                  child: FancyShimmerImage(
                    imageUrl: getCurrentProduct
                        .imageUrl, //'https://i.ibb.co/F0s3FHQ/Apricots.png',
                    boxFit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     IconlyLight.bag2,
                          //     color: color,
                          //   ),
                          // ),

                          // GestureDetector(
                          //   onTap: isInCart
                          //       ? null
                          //       : () async {
                          //           final User? user =
                          //               firebaseAuthObject.currentUser;
                          //           if (user == null) {
                          //             GlobalMethods.errorDialogue(
                          //                 subtitle: "Please Login to Continue",
                          //                 context: context);
                          //             return;
                          //           }
                          //           await GlobalMethods.addToCart(
                          //             productId: productModelobj.id,
                          //             quantity: 1,
                          //             context: context,
                          //           );

                          //           await cartProvidersobj.fetchCart();
                          //           // cartProvidersobj.addProductsToCart(
                          //           //     productId: productModelobj.id,
                          //           //     quantity: 1);
                          //         },
                          //   child: Icon(
                          //     isInCart ? IconlyBold.bag2 : IconlyLight.bag2,
                          //     size: 22,
                          //     color: isInCart ? Colors.green : color,
                          //   ),
                          // ),

                          HeartIconWidget(
                            productId: getCurrentProduct.id,
                            isInWishlist: _isInWishlist,
                          ),
                        ],
                      ),
                    ),
                    TextWidget(
                      text: getCurrentProduct.title,
                      color: color,
                      textSize: 20.0,
                      maxlines: 1,
                      isTitle: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      text: 'Rs ${productPrice.toStringAsFixed(2)}',
                      color: color,
                      textSize: 18.0,
                      maxlines: 1,
                      isTitle: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

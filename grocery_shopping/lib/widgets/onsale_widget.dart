// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/inner_screens/product_details.dart';
import 'package:grocery_shopping/models/product_model.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/heart_icon.dart';
import 'package:grocery_shopping/widgets/price_widget.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:provider/provider.dart';

class OnsaleWidget extends StatefulWidget {
  const OnsaleWidget({super.key});

  @override
  State<OnsaleWidget> createState() => _OnsaleWidgetState();
}

class _OnsaleWidgetState extends State<OnsaleWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utilities(context).getTheme;
    final Size size = Utilities(context).getScreenSize;
    Color color = Utilities(context).color;
    final productModelobj = Provider.of<ProductModel>(context);
    final cartProvidersobj = Provider.of<CartProviders>(context);
    bool isInCart =
        cartProvidersobj.getCartItems.containsKey(productModelobj.id);

    final wishlistProviderOObject = Provider.of<WishlistProviders>(context);
    bool? _isInWishlist = wishlistProviderOObject.getWishlistItems
        .containsKey(productModelobj.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: theme
            ? const Color(0xFF0a0d2c)
            : Colors.white, //Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productModelobj.id);
            // GlobalMethods.navigateTo(
            //     ctx: context, routeName: ProductDetails.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade600),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                        imageUrl: productModelobj
                            .imageUrl, // 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                        width: size.width * 0.2,
                        height: size.width * 0.2,

                        boxFit: BoxFit.fill,
                      ),
                      // Image.network(
                      //   'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      //   width: size.width * 0.22,
                      //   height: size.width * 0.22,
                      //   fit: BoxFit.fill,
                      // ),
                      const SizedBox(
                        width: 6,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: productModelobj.isPiece ? '1 Piece' : '1 KG',
                            color: color,
                            textSize: 22,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          HeartIconWidget(
                            productId: productModelobj.id,
                            isInWishlist: _isInWishlist,
                          )
                        ],
                      ),
                    ],
                  ),
                  PriceWidget(
                    onSalePrice: productModelobj.salePrice,
                    price: productModelobj.price,
                    textPrice: '1',
                    isOnSale: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: productModelobj.title,
                    color: color,
                    textSize: 17,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: isInCart
                        ? null
                        : () async {
                            final User? user = firebaseAuthObject.currentUser;
                            if (user == null) {
                              GlobalMethods.errorDialogue(
                                  subtitle: "Please Login to Continue",
                                  context: context);
                              return;
                            }
                            await GlobalMethods.addToCart(
                              productId: productModelobj.id,
                              quantity: 1,
                              context: context,
                            );

                            await cartProvidersobj.fetchCart();
                            // cartProvidersobj.addProductsToCart(
                            //     productId: productModelobj.id,
                            //     quantity: 1);
                          },
                    child: Icon(
                      isInCart ? IconlyBold.bag2 : IconlyLight.bag2,
                      size: 22,
                      color: isInCart ? Colors.green : color,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

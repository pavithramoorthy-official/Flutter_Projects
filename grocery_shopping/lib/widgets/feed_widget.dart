// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:provider/provider.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({
    super.key,
  });

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  TextEditingController _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final utilities = Utilities(context);
    final theme = Utilities(context).getTheme;
    Size size = utilities.getScreenSize;
    Color color = utilities.color;
    final productModelObject = Provider.of<ProductModel>(context);
    final cartProvidersobj = Provider.of<CartProviders>(context);
    bool? isInCart =
        cartProvidersobj.getCartItems.containsKey(productModelObject.id);

    final wishlistProvidersObject = Provider.of<WishlistProviders>(context);

    bool? _isInWishlist = wishlistProvidersObject.getWishlistItems
        .containsKey(productModelObject.id);

    return Padding(
      padding:
          const EdgeInsets.fromLTRB(8, 2, 8, 2), //const EdgeInsets.all(8.0),
      child: Material(
        color: theme
            ? const Color(0xFF0a0d2c)
            : Colors.white, //Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productModelObject.id);
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
            child: Column(
              children: [
                FancyShimmerImage(
                  imageUrl: productModelObject
                      .imageUrl, //'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  height: size.width * 0.21,
                  width: size.width * 0.2,
                  boxFit: BoxFit.fill,
                ),
                //2nd child of column
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextWidget(
                          text: productModelObject.title, //"Name",
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                      ),
                      HeartIconWidget(
                        productId: productModelObject.id,
                        isInWishlist: _isInWishlist,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: PriceWidget(
                          onSalePrice: productModelObject.salePrice,
                          price: productModelObject.price,
                          textPrice: _quantityTextController.text,
                          isOnSale: productModelObject.isOnSale ? true : false,
                        ),
                      ),
                      //original script
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      FittedBox(
                        child: TextWidget(
                          text: productModelObject.isPiece ? 'Piece' : 'KG',
                          color: color,
                          textSize: 18,
                          isTitle: true,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            Flexible(
                              child: TextFormField(
                                // onChanged: (value) {
                                //   setState(() {
                                //     if (value.isEmpty | (value == '0')) {
                                //       _quantityTextController.text = '1';
                                //     } else {}
                                //   });
                                // },
                                onSaved: (value) {},
                                controller: _quantityTextController,
                                key: const ValueKey('10'),
                                style: TextStyle(
                                  color: color,
                                  fontSize: 18,
                                ),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                enabled: true,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                cursorColor: Colors.green,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.,]'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: isInCart
                        ? null
                        : () async {
                            final User? user = firebaseAuthObject.currentUser;
                            if (user == null) {
                              GlobalMethods.errorDialogue(
                                  subtitle: "Please Login to Continue",
                                  context: context);
                              return;
                            }
                            if (_quantityTextController.text == '0' ||
                                (_quantityTextController.text == ' ')) {
                              _quantityTextController.text = '1';
                            }
                            await GlobalMethods.addToCart(
                              productId: productModelObject.id,
                              quantity: int.parse(_quantityTextController.text),
                              context: context,
                            );

                            await cartProvidersobj.fetchCart();
                            // cartProvidersobj.addProductsToCart(
                            //     productId: productModelObject.id,
                            //     quantity:
                            //         int.parse(_quantityTextController.text));
                          },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.amberAccent.shade100.withOpacity(0.9),
                        //Theme.of(context).cardColor,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    child: TextWidget(
                      text: isInCart ? "In Cart" : "Add to Cart",
                      color: Colors.black,
                      textSize: 20,
                      maxlines: 1,
                      isTitle: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

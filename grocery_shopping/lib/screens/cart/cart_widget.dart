// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_shopping/inner_screens/product_details.dart';
import 'package:grocery_shopping/models/cart_model.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
//import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/heart_icon.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({
    super.key,
    required this.q,
  });
  final int q;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = widget.q.toString();
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utilities(context).getTheme;
    Size size = Utilities(context).getScreenSize;
    Color color = Utilities(context).color;
    final productProvidersObject = Provider.of<ProductProviders>(context);
    final cartModelProvider = Provider.of<CartModel>(context);
    final getCurrentProduct =
        productProvidersObject.findProductbyId(cartModelProvider.productId);
    final productPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;
    final cartProvidersObject = Provider.of<CartProviders>(context);
    final wishlistProvidersObject = Provider.of<WishlistProviders>(context);
    bool? _isInWishlist = wishlistProvidersObject.getWishlistItems
        .containsKey(getCurrentProduct.id);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: cartModelProvider.productId);
        // GlobalMethods.navigateTo(
        //     ctx: context, routeName: ProductDetails.routeName);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                  color: theme
                      ? const Color(0xFF0a0d2c)
                      : Colors
                          .white, //Theme.of(context).cardColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(
                    children: [
                      Container(
                        height: size.width * 0.23,
                        width: size.width * 0.23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: FancyShimmerImage(
                          imageUrl: getCurrentProduct
                              .imageUrl, //'https://i.ibb.co/F0s3FHQ/Apricots.png',
                          boxFit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: getCurrentProduct.title,
                            color: color,
                            textSize: 18,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Row(
                              children: [
                                _quantityController(
                                  fcn: () {
                                    if (_quantityTextController.text == '1') {
                                      return;
                                    } else {
                                      setState(() {
                                        cartProvidersObject
                                            .increaseQuantityByOne(
                                                cartModelProvider.productId);
                                        _quantityTextController.text =
                                            (int.parse(_quantityTextController
                                                        .text) -
                                                    1)
                                                .toString();
                                      });
                                    }
                                  },
                                  color: Colors.redAccent,
                                  icon: CupertinoIcons.minus,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: TextField(
                                    controller: _quantityTextController,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'),
                                      ),
                                    ],
                                    onChanged: (v) {
                                      setState(() {
                                        if (v.isEmpty) {
                                          _quantityTextController.text = '1';
                                        } else {
                                          return;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                _quantityController(
                                  fcn: () {
                                    cartProvidersObject.increaseQuantityByOne(
                                        cartModelProvider.productId);
                                    setState(() {
                                      _quantityTextController.text = (int.parse(
                                                  _quantityTextController
                                                      .text) +
                                              1)
                                          .toString();
                                    });
                                  },
                                  color: Colors.green,
                                  icon: CupertinoIcons.add,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                await cartProvidersObject.removeOneItem(
                                    cartId: cartModelProvider.id,
                                    productId: cartModelProvider.productId,
                                    quantity: cartModelProvider.quantity);
                              },
                              child: const Icon(
                                CupertinoIcons.cart_fill_badge_minus,
                                color: Colors.redAccent,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            HeartIconWidget(
                              productId: getCurrentProduct.id,
                              isInWishlist: _isInWishlist,
                            ),
                            TextWidget(
                              text:
                                  "Rs ${(productPrice * int.parse(_quantityTextController.text)).toStringAsFixed(2)}",
                              color: color,
                              textSize: 18,
                              maxlines: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityController(
      {required Function fcn, required Color color, required IconData icon}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () {
              fcn();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

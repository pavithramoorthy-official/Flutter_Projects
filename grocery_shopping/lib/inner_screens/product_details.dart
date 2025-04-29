import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/providers/viewed_providers.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/heart_icon.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  static const routeName = '/ProductDetails';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1'; // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utilities(context).getTheme;
    final Color color = Utilities(context).color;
    Size size = Utilities(context).getScreenSize;

    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final cartProvidersObject = Provider.of<CartProviders>(context);
    final productProvidesObject = Provider.of<ProductProviders>(context);
    final getCurrentProduct = productProvidesObject.findProductbyId(productId);
    final productPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;
    final totalPrice = productPrice * int.parse(_quantityTextController.text);
    bool isInCart =
        cartProvidersObject.getCartItems.containsKey(getCurrentProduct.id);
    final wishlistProvidersObject = Provider.of<WishlistProviders>(context);
    bool? _isInWishlist = wishlistProvidersObject.getWishlistItems
        .containsKey(getCurrentProduct.id);

    final viewedProvidersObject = Provider.of<ViewedProviders>(context);

    return WillPopScope(
      onWillPop: () async {
        viewedProvidersObject.addViewedItemToHistory(productId: productId);
        print("productId from porduct details : $productId");

        return true;
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
              viewedProvidersObject.addViewedItemToHistory(
                  productId: productId);
            },
            child: Icon(
              IconlyLight.arrowLeft2,
              color: color,
              size: 24,
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: FancyShimmerImage(
                imageUrl: getCurrentProduct
                    .imageUrl, // 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                // height: size.width * 0.21,
                width: size.width,
                boxFit: BoxFit.scaleDown,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                  color: theme
                      ? const Color(0xFF0a0d2c)
                      : Colors.white, //Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextWidget(
                              text: getCurrentProduct.title, //"Title",
                              color: color,
                              textSize: 24,
                              isTitle: true,
                            ),
                          ),
                          HeartIconWidget(
                            productId: getCurrentProduct.id,
                            isInWishlist: _isInWishlist,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 27, right: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Rs ${productPrice.toStringAsFixed(2)}/",
                            color: Colors.green,
                            textSize: 20,
                            isTitle: true,
                          ),
                          TextWidget(
                            text: getCurrentProduct.isPiece ? 'Piece' : 'Kg',
                            color: Colors.green,
                            textSize: 22,
                            isTitle: true,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Visibility(
                            visible: getCurrentProduct.isOnSale ? true : false,
                            child: TextWidget(
                              text:
                                  "Rs ${getCurrentProduct.price.toStringAsFixed(2)}",
                              color: color,
                              textSize: 16,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        quantityIconController(
                          fcn: () {
                            if (_quantityTextController.text == '1') {
                              return;
                            } else {
                              setState(() {
                                _quantityTextController.text =
                                    (int.parse(_quantityTextController.text) -
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
                            key: const ValueKey('quantity'),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                            ),
                            textAlign: TextAlign.center,
                            cursorColor: Colors.green,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9]'),
                              ),
                            ],
                            onChanged: (v) {
                              setState(() {
                                if (v.isEmpty) {
                                  _quantityTextController.text = '1';
                                } else {}
                              });
                            },
                          ),
                        ),
                        quantityIconController(
                          fcn: () {
                            setState(() {
                              _quantityTextController.text =
                                  (int.parse(_quantityTextController.text) + 1)
                                      .toString();
                            });
                          },
                          color: Colors.green,
                          icon: CupertinoIcons.add,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        color: theme
                            ? const Color(0xFF0a0d2c)
                            : Colors
                                .white, // Theme.of(context).cardColor.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Total",
                                  color: Colors.red.shade400,
                                  textSize: 20,
                                  isTitle: true,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                FittedBox(
                                  child: Row(
                                    children: [
                                      TextWidget(
                                        text:
                                            "Rs ${totalPrice.toStringAsFixed(2)} / ",
                                        color: color,
                                        textSize: 20,
                                        isTitle: true,
                                      ),
                                      TextWidget(
                                        text:
                                            "${_quantityTextController.text}Kg",
                                        color: color,
                                        textSize: 16,
                                        isTitle: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: isInCart
                                    ? null
                                    : () async {
                                        final User? user =
                                            firebaseAuthObject.currentUser;
                                        if (user == null) {
                                          GlobalMethods.errorDialogue(
                                              subtitle:
                                                  "Please Login to Continue",
                                              context: context);
                                          return;
                                        }
                                        await GlobalMethods.addToCart(
                                          productId: getCurrentProduct.id,
                                          quantity: int.parse(
                                              _quantityTextController.text),
                                          context: context,
                                        );

                                        await cartProvidersObject.fetchCart();
                                        // cartProvidersObject.addProductsToCart(
                                        //   productId: getCurrentProduct.id,
                                        //   quantity: int.parse(
                                        //       _quantityTextController.text),
                                        // );
                                      },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextWidget(
                                      text:
                                          isInCart ? "In Cart" : "Add to Cart",
                                      color: Colors.white,
                                      textSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quantityIconController(
      {required Function fcn, required Color color, required IconData icon}) {
    return Flexible(
      flex: 2,
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
    );
  }
}

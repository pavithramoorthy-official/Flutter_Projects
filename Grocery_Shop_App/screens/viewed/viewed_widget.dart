import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/inner_screens/product_details.dart';
import 'package:grocery_shopping/models/viewed_model.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ViewedRecentlyWidget extends StatefulWidget {
  const ViewedRecentlyWidget({super.key});

  @override
  State<ViewedRecentlyWidget> createState() => _ViewedRecentlyWidgetState();
}

class _ViewedRecentlyWidgetState extends State<ViewedRecentlyWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utilities(context).getTheme;
    final Color color = Utilities(context).color;
    Size size = Utilities(context).getScreenSize;

    final productProvidersObject = Provider.of<ProductProviders>(context);
    final viewedModelObject = Provider.of<ViewedModel>(context);
    final getCurrentProduct =
        productProvidersObject.findProductbyId(viewedModelObject.productId);
    double productPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;

    final cartProvidersObject = Provider.of<CartProviders>(context);
    bool? _isInCart =
        cartProvidersObject.getCartItems.containsKey(getCurrentProduct.id);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade600),
          color: theme
              ? const Color(0xFF0a0d2c)
              : Colors.white, //Theme.of(context).cardColor,
        ),
        child: GestureDetector(
          onTap: () {
            // GlobalMethods.navigateTo(
            //     ctx: context, routeName: ProductDetails.routeName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FancyShimmerImage(
                imageUrl: getCurrentProduct
                    .imageUrl, //'https://i.ibb.co/F0s3FHQ/Apricots.png',
                boxFit: BoxFit.fill,
                height: size.width * 0.27,
                width: size.width * 0.25,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  TextWidget(
                    text: getCurrentProduct.title, //'Title',
                    color: color,
                    textSize: 24,
                    isTitle: true,
                  ),
                  TextWidget(
                    text: 'Rs ${productPrice.toStringAsFixed(2)}', //'Rs 80.00',
                    color: color,
                    textSize: 24,
                    isTitle: false,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: _isInCart
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
                              productId: getCurrentProduct.id,
                              quantity: 1,
                              context: context,
                            );
                            await cartProvidersObject.fetchCart();
                            // cartProvidersObject.addProductsToCart(
                            //     productId: getCurrentProduct.id, quantity: 1);
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        _isInCart ? Icons.check : IconlyBold.plus,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

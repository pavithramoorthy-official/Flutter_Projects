import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/screens/cart/cart_widget.dart';
import 'package:grocery_shopping/widgets/empty_cart.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utilities(context).color;
    //Size size = Utilities(context).getScreenSize;
    final cartProvidersobj = Provider.of<CartProviders>(context);
    final cartItemList = cartProvidersobj.getCartItems.values.toList();
    return cartItemList.isEmpty
        ? const EmptyScreen(
            imagePath: 'assets/images/offers/emptybox.jpeg',
            title: 'Whoops!',
            subTitle: 'No items in your cart yet!',
            buttonText: 'Shop Now',
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TextWidget(
                text: "Cart (${cartProvidersobj.getCartItems.length})",
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialogue(
                        title: 'Empty your Cart?',
                        subtitle: 'Are you sure?',
                        fcn: () async {
                          await cartProvidersobj.clearOnlineCart();
                          cartProvidersobj.clearLocalCart();
                        },
                        context: context);
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: color,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                _checkOut(ctx: context),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartItemList.length,
                      itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider.value(
                          value: cartItemList[index],
                          child: CartWidget(
                            q: cartItemList[index].quantity,
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
  }

  Widget _checkOut({required BuildContext ctx}) {
    final Color color = Utilities(ctx).color;
    Size size = Utilities(ctx).getScreenSize;
    final cartProvidersobj = Provider.of<CartProviders>(ctx);
    double total = 0.0;
    final productProvidersObject = Provider.of<ProductProviders>(ctx);

    cartProvidersobj.getCartItems.forEach(
      (key, value) {
        final getCurrentProduct =
            productProvidersObject.findProductbyId(value.productId);
        total += (getCurrentProduct.isOnSale
                ? getCurrentProduct.salePrice
                : getCurrentProduct.price) *
            value.quantity;
      },
    );

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Row(
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text: "Order Now", color: Colors.white, textSize: 20),
                ),
                onTap: () {},
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: "Total : Rs ${total.toStringAsFixed(2)}",
                color: color,
                textSize: 18,
                isTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

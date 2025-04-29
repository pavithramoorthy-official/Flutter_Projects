import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_shopping/providers/wishlist_providers.dart';
import 'package:grocery_shopping/screens/wishlist/wishlist_widget.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/back_widget.dart';
import 'package:grocery_shopping/widgets/empty_cart.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});
  static const routeName = '/WishlistScreen';

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utilities(context).color;
    //Size size = Utilities(context).getScreenSize;
    final wishlistProvidersObject = Provider.of<WishlistProviders>(context);
    final wishlistItemList =
        wishlistProvidersObject.getWishlistItems.values.toList();

    return wishlistItemList.isEmpty
        ? const EmptyScreen(
            imagePath: 'assets/images/offers/emptybox.jpeg',
            title: 'Your Wishlist is empty !!!',
            subTitle: 'Explore more to shortlist items...',
            buttonText: 'Shop Now',
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: const BackWidget(),
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TextWidget(
                text: "Wishlist ()",
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialogue(
                        title: 'Empty your Wishlist?',
                        subtitle: 'Are you Sure?',
                        fcn: () async {
                          await wishlistProvidersObject.clearOnlineWishList();
                          wishlistProvidersObject.clearLocalWishlist();
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
            body: MasonryGridView.count(
              itemCount: wishlistItemList.length,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: wishlistItemList[index],
                  child: const WishlistWidget(),
                );
              },
            ),
          );
  }
}

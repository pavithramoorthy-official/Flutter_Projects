//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/providers/viewed_providers.dart';
import 'package:grocery_shopping/screens/viewed/viewed_widget.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/back_widget.dart';
import 'package:grocery_shopping/widgets/empty_cart.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  const ViewedRecentlyScreen({super.key});
  static const routeName = '/ViewedRecentlyScreen';

  @override
  State<ViewedRecentlyScreen> createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    final Color color = Utilities(context).color;
    //Size size = Utilities(context).getScreenSize;

    final viewedProvidersObject = Provider.of<ViewedProviders>(context);
    final viewedProductsItemList =
        viewedProvidersObject.getViewedItemsList.values.toList();

    if (viewedProductsItemList.isEmpty) {
      return const EmptyScreen(
        imagePath: 'assets/images/offers/emptybox.jpeg',
        title: 'Your history is Empty!',
        subTitle: 'No products has been viewd yet',
        buttonText: 'Shop Now',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: const BackWidget(),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: "Viewed List ()",
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialogue(
                    title: 'Empty your Viewed List?',
                    subtitle: 'Are you Sure?',
                    fcn: () {
                      viewedProvidersObject.clearHistory();
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
        body: ListView.builder(
            itemCount: viewedProductsItemList.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: ChangeNotifierProvider.value(
                  value: viewedProductsItemList[index],
                  child: const ViewedRecentlyWidget(),
                ),
              );
            }),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:grocery_shopping/models/product_model.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/back_widget.dart';
import 'package:grocery_shopping/widgets/empty_product.dart';
import 'package:grocery_shopping/widgets/onsale_widget.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});
  static const routeName = '/OnSaleScreen';

  @override
  Widget build(BuildContext context) {
    Color color = Utilities(context).color;
    Size size = Utilities(context).getScreenSize;
    final productProviderobj = Provider.of<ProductProviders>(context);
    List<ProductModel> allOnSaleProductList =
        productProviderobj.getOnSaleProductList;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        title: TextWidget(
          text: "Products on Sale",
          color: color,
          textSize: 22,
          isTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      // ignore: dead_code
      body: allOnSaleProductList.isEmpty
          // ignore: dead_code
          ? const EmptyProduct(
              textForEmptyScreen: "No Products on Sale yet!!!\nStay Tuned...",
            )
          // ignore: dead_code
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / size.width * 1.1,
              children: List.generate(allOnSaleProductList.length, (index) {
                return ChangeNotifierProvider.value(
                    value: allOnSaleProductList[index],
                    child: const OnsaleWidget());
              }),
            ),
    );
  }
}

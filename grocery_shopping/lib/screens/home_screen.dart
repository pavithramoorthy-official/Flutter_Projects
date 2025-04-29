import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/constants/const_lists.dart';
import 'package:grocery_shopping/inner_screens/feed_screen.dart';
import 'package:grocery_shopping/inner_screens/onsale_screen.dart';
import 'package:grocery_shopping/models/product_model.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/feed_widget.dart';
import 'package:grocery_shopping/widgets/onsale_widget.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //final themeState = Provider.of<DarkThemeProvider>(context);

    Utilities utilities = Utilities(context);
    //final themeState = utilities.getTheme;
    Size size = utilities.getScreenSize;
    Color color = Utilities(context).color;
    final productProviderObject = Provider.of<ProductProviders>(context);
    List<ProductModel> allProductDetail =
        productProviderObject.getProductDetails;
    List<ProductModel> allOnSaleProduct =
        productProviderObject.getOnSaleProductList;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    ConstList.offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: ConstList.offerImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.red, color: Colors.white),
                ),
                //control: SwiperControl(color: Colors.black), ==> display this >
              ),
            ),

            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: "View All",
                color: Colors.cyan,
                textSize: 20,
                isTitle: true,
                maxlines: 1,
              ),
            ),

            // onsale widget starts here

            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On Sale".toUpperCase(),
                        color: Colors.red,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.26,
                    child: ListView.builder(
                        itemCount: allOnSaleProduct.length < 10
                            ? allOnSaleProduct.length
                            : 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return ChangeNotifierProvider.value(
                              value: allOnSaleProduct[index],
                              child: const OnsaleWidget());
                        }),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Our Products",
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: FeedScreen.routeName);
                    },
                    child: const Text(
                      "Browse all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: size.width / size.width * 0.78,
              children: List.generate(
                  allProductDetail.length < 4 ? allProductDetail.length : 4,
                  (index) {
                return ChangeNotifierProvider.value(
                  value: allProductDetail[index],
                  child: const FeedWidget(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grocery_shopping/models/product_model.dart';
import 'package:grocery_shopping/providers/product_providers.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/back_widget.dart';
import 'package:grocery_shopping/widgets/empty_product.dart';
import 'package:grocery_shopping/widgets/feed_widget.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});
  static const routeName = '/FeedScreen';

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController _searchTextController = TextEditingController();
  FocusNode _searchTextFocusNode = FocusNode();
  List<ProductModel> listProductSearch = [];

  @override
  void dispose() {
    // TODO: implement dispose
    _searchTextController.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utilities(context).color;
    Size size = Utilities(context).getScreenSize;
    final productProviderObject = Provider.of<ProductProviders>(context);

    List<ProductModel> allProductDetail =
        productProviderObject.getProductDetails;

    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        centerTitle: true,
        title: TextWidget(
          text: "All Products",
          color: color,
          textSize: 22,
          isTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchTextController,
                  onChanged: (valuee) {
                    setState(() {
                      listProductSearch =
                          productProviderObject.searchProductByName(valuee);
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 2,
                      ),
                    ),
                    hintText: "What's on your mind?",
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffix: IconButton(
                        onPressed: () {
                          _searchTextController.clear();
                          _searchTextFocusNode.unfocus();
                        },
                        icon: Icon(
                          Icons.close,
                          color: _searchTextFocusNode.hasFocus
                              ? Colors.red
                              : color,
                        )),
                  ),
                ),
              ),
            ),
            _searchTextController.text.isNotEmpty && listProductSearch.isEmpty
                ? const EmptyProduct(
                    textForEmptyScreen: "Product not Available")
                : GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    padding: EdgeInsets.zero,
                    childAspectRatio: size.width / size.width * 0.78,
                    children: List.generate(
                        _searchTextController.text.isNotEmpty &&
                                listProductSearch.isEmpty
                            ? listProductSearch.length
                            : allProductDetail.length, (index) {
                      return ChangeNotifierProvider.value(
                        value: _searchTextController.text.isNotEmpty &&
                                listProductSearch.isEmpty
                            ? listProductSearch[index]
                            : allProductDetail[index],
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

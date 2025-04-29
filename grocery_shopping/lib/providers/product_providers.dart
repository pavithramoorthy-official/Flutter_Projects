import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/models/product_model.dart';

class ProductProviders with ChangeNotifier {
  //getter
  static List<ProductModel> _productsList = [];
  List<ProductModel> get getProductDetails {
    return _productsList;
  }

  List<ProductModel> get getOnSaleProductList {
    return _productsList.where((element) => element.isOnSale).toList();
  }

  // function to display product details when you click on the product image

  ProductModel findProductbyId(String productId) {
    return _productsList.firstWhere((element) => element.id == productId);
  }

  Future<void> fetchProductsFromFirebase() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      //_productsList = [];
      for (var element in productSnapshot.docs) {
        _productsList.insert(
            0,
            ProductModel(
              id: element.get('id'),
              title: element.get('title'),
              imageUrl: element.get('imageUrl'),
              productCategoryName: element.get('productCategory'),
              price: double.parse(element.get('price')),
              salePrice: double.parse(element.get('salePrice')),
              isOnSale: element.get('isOnSale'),
              isPiece: element.get('isPiece'),
            ));
      }
    });
    notifyListeners();
  }

  // function to display products based on category

  List<ProductModel> findByCategory(String categoryname) {
    List<ProductModel> _chosenProductCategory = _productsList
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryname.toLowerCase()))
        .toList();
    return _chosenProductCategory;
  }

  List<ProductModel> searchProduct(String searchText) {
    List<ProductModel> _searchedProductList = _productsList
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return _searchedProductList;
  }

  // static final List<ProductModel> _productsList = [
  //   ProductModel(
  //     id: 'Apricot',
  //     title: 'Apricot',
  //     price: 100,
  //     salePrice: 50,
  //     imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
  //     productCategoryName: 'Fruits',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Avocado',
  //     title: 'Avocado',
  //     price: 90,
  //     salePrice: 45,
  //     imageUrl: 'https://i.ibb.co/9VKXw5L/Avocat.png',
  //     productCategoryName: 'Fruits',
  //     isOnSale: false,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Black grapes',
  //     title: 'Black grapes',
  //     price: 22,
  //     salePrice: 7,
  //     imageUrl: 'https://i.ibb.co/c6w5zrC/Black-Grapes-PNG-Photos.png',
  //     productCategoryName: 'Fruits',
  //     isOnSale: true,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Fresh_green_grape',
  //     title: 'Fresh green grape',
  //     price: 50,
  //     salePrice: 25,
  //     imageUrl: 'https://i.ibb.co/HKx2bsp/Fresh-green-grape.png',
  //     productCategoryName: 'Fruits',
  //     isOnSale: true,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Green grape',
  //     title: 'Green grape',
  //     price: 100,
  //     salePrice: 40,
  //     imageUrl: 'https://i.ibb.co/bHKtc33/grape-green.png',
  //     productCategoryName: 'Fruits',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Red apple',
  //     title: 'Red apple',
  //     price: 60,
  //     salePrice: 20,
  //     imageUrl: 'https://i.ibb.co/crwwSG2/red-apple.png',
  //     productCategoryName: 'Fruits',
  //     isOnSale: true,
  //     isPiece: false,
  //   ),
  //   // Vegi
  //   ProductModel(
  //     id: 'Carottes',
  //     title: 'Carottes',
  //     price: 80,
  //     salePrice: 50,
  //     imageUrl: 'https://i.ibb.co/TRbNL3c/Carottes.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: true,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Cauliflower',
  //     title: 'Cauliflower',
  //     price: 30,
  //     salePrice: 15,
  //     imageUrl: 'https://i.ibb.co/xGWf2rH/Cauliflower.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Cucumber',
  //     title: 'Cucumber',
  //     price: 67,
  //     salePrice: 42,
  //     imageUrl: 'https://i.ibb.co/kDL5GKg/cucumbers.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Jalape',
  //     title: 'Jalape',
  //     price: 91,
  //     salePrice: 89,
  //     imageUrl: 'https://i.ibb.co/Dtk1YP8/Jalape-o.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Long yam',
  //     title: 'Long yam',
  //     price: 29,
  //     salePrice: 15,
  //     imageUrl: 'https://i.ibb.co/V3MbcST/Long-yam.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Onions',
  //     title: 'Onions',
  //     price: 59,
  //     salePrice: 28,
  //     imageUrl: 'https://i.ibb.co/GFvm1Zd/Onions.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Plantain-flower',
  //     title: 'Plantain-flower',
  //     price: 100,
  //     salePrice: 38,
  //     imageUrl: 'https://i.ibb.co/RBdq0PD/Plantain-flower.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Potato',
  //     title: 'Potato',
  //     price: 100,
  //     salePrice: 59,
  //     imageUrl: 'https://i.ibb.co/wRgtW55/Potato.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: true,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Radish',
  //     title: 'Radish',
  //     price: 100,
  //     salePrice: 79,
  //     imageUrl: 'https://i.ibb.co/YcN4ZsD/Radish.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Red peppers',
  //     title: 'Red peppers',
  //     price: 75,
  //     salePrice: 57,
  //     imageUrl: 'https://i.ibb.co/JthGdkh/Red-peppers.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Squash',
  //     title: 'Squash',
  //     price: 40,
  //     salePrice: 28,
  //     imageUrl: 'https://i.ibb.co/p1V8sq9/Squash.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: true,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Tomatoes',
  //     title: 'Tomatoes',
  //     price: 50,
  //     salePrice: 39,
  //     imageUrl: 'https://i.ibb.co/PcP9xfK/Tomatoes.png',
  //     productCategoryName: 'Vegetables',
  //     isOnSale: true,
  //     isPiece: false,
  //   ),
  //   // Grains
  //   ProductModel(
  //     id: 'Corn-cobs',
  //     title: 'Corn-cobs',
  //     price: 20,
  //     salePrice: 10,
  //     imageUrl: 'https://i.ibb.co/8PhwVYZ/corn-cobs.png',
  //     productCategoryName: 'Grains',
  //     isOnSale: false,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Peas',
  //     title: 'Peas',
  //     price: 80,
  //     salePrice: 50,
  //     imageUrl: 'https://i.ibb.co/7GHM7Dp/peas.png',
  //     productCategoryName: 'Grains',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   // Herbs
  //   ProductModel(
  //     id: 'Asparagus',
  //     title: 'Asparagus',
  //     price: 60,
  //     salePrice: 40,
  //     imageUrl: 'https://i.ibb.co/RYRvx3W/Asparagus.png',
  //     productCategoryName: 'Herbs',
  //     isOnSale: false,
  //     isPiece: false,
  //   ),
  //   ProductModel(
  //     id: 'Brokoli',
  //     title: 'Brokoli',
  //     price: 100,
  //     salePrice: 80,
  //     imageUrl: 'https://i.ibb.co/KXTtrYB/Brokoli.png',
  //     productCategoryName: 'Herbs',
  //     isOnSale: true,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Buk-choy',
  //     title: 'Buk-choy',
  //     price: 70,
  //     salePrice: 60,
  //     imageUrl: 'https://i.ibb.co/MNDxNnm/Buk-choy.png',
  //     productCategoryName: 'Herbs',
  //     isOnSale: true,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Chinese-cabbage-wombok',
  //     title: 'Chinese-cabbage-wombok',
  //     price: 100,
  //     salePrice: 75,
  //     imageUrl: 'https://i.ibb.co/7yzjHVy/Chinese-cabbage-wombok.png',
  //     productCategoryName: 'Herbs',
  //     isOnSale: false,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Kangkong',
  //     title: 'Kangkong',
  //     price: 90,
  //     salePrice: 35,
  //     imageUrl: 'https://i.ibb.co/HDSrR2Y/Kangkong.png',
  //     productCategoryName: 'Herbs',
  //     isOnSale: false,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Leek',
  //     title: 'Leek',
  //     price: 100,
  //     salePrice: 55,
  //     imageUrl: 'https://i.ibb.co/Pwhqkh6/Leek.png',
  //     productCategoryName: 'Herbs',
  //     isOnSale: false,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Spinach',
  //     title: 'Spinach',
  //     price: 80,
  //     salePrice: 50,
  //     imageUrl: 'https://i.ibb.co/bbjvgcD/Spinach.png',
  //     productCategoryName: 'Herbs',
  //     isOnSale: true,
  //     isPiece: true,
  //   ),
  //   ProductModel(
  //     id: 'Almond',
  //     title: 'Almond',
  //     price: 100,
  //     salePrice: 65,
  //     imageUrl: 'https://i.ibb.co/c8QtSr2/almand.jpg',
  //     productCategoryName: 'Nuts',
  //     isOnSale: true,
  //     isPiece: false,
  //   ),
  // ];
}

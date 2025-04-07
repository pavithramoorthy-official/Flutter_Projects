import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/feature/add_products/model/product_model.dart';

class NavigationState{
  final int currentIndex;
  final ProductModel? productModel;

  NavigationState({required this.currentIndex, this.productModel});
}

class NavigationNotifier extends StateNotifier<NavigationState>{
  NavigationNotifier() : super(NavigationState(currentIndex : 0));

  void navigateTo(int index,{ProductModel? data}){
    state = NavigationState(currentIndex: index,productModel: data);
}
}
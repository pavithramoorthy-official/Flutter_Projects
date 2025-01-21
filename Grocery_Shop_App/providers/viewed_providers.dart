import 'package:flutter/material.dart';
import 'package:grocery_shopping/models/viewed_model.dart';

class ViewedProviders with ChangeNotifier {
  Map<String, ViewedModel> _viewedItemsList = {};

  Map<String, ViewedModel> get getViewedItemsList {
    return _viewedItemsList;
  }

  void addViewedItemToHistory({required String productId}) {
    _viewedItemsList.putIfAbsent(
      productId,
      () => ViewedModel(
        id: DateTime.now().toString(),
        productId: productId,
      ),
    );
    notifyListeners();
  }

  void clearHistory() {
    _viewedItemsList.clear();
    notifyListeners();
  }
}

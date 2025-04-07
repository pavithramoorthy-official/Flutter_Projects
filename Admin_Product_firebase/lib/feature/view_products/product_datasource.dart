import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:savings_admin/core/router/app_router.gr.dart';
import 'package:savings_admin/feature/add_products/add_product.dart';
import 'package:savings_admin/feature/provider/navigation_provider.dart';
import 'package:savings_admin/ui_components/ui_space.dart';
import 'package:savings_admin/ui_components/ui_text.dart';

import '../add_products/model/product_model.dart';

class ProductDatasource extends DataTableSource {
  ProductDatasource(
    this._products,
    this.context,
    this.ref,
  );

  final List<ProductModel> _products;
  final BuildContext context;
  final WidgetRef ref;

  void navigateToEditPage(ProductModel product) {
    context.router.push(AddProductRoute(product: product));
  }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index > _products.length) return null;
    final _productData = _products[index];
    print("Index: $index, Product Data: $_productData");

    return DataRow.byIndex(index: index, cells: [
      DataCell(Center(
          child: UiText(
        label: _productData.productDate ?? "-",
        fontWeight: FontWeight.w200,
      ))),
      DataCell(Center(
          child: UiText(
        label: _productData.productName ?? "-",
        fontWeight: FontWeight.w200,
      ))),
      DataCell(Center(
          child: UiText(
        label: _productData.productQuantity.toString() ?? "-",
        fontWeight: FontWeight.w200,
      ))),
      DataCell(Center(
          child: UiText(
        label: _productData.productPrice.toString() ?? "-",
        fontWeight: FontWeight.w200,
      ))),
      DataCell(Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                ref
                    .read(navigationProvider.notifier)
                    .navigateTo(1, data: _productData);
              },
              icon: Icon(Icons.edit)),
          UiSpace.horizontal(10),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: UiText(label: "Are you sure, you want to Delete the below product?"),
                        content: Text(
                            "Name :  ${_productData.productName}\nQuantity : ${_productData.productQuantity}\nPrice : ${_productData.productPrice}"),
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        actions: [
                          TextButton(

                              onPressed: () {
                                Navigator.of(context).pop();
                              },

                              child: UiText(
                                label: "Cancel",
                                fontColor: Colors.white,
                              ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.purple.shade300)
                          ),),
                          TextButton(
                              onPressed: () {
                                _deleteProduct(_productData.id);
                                Navigator.of(context).pop();
                              },
                              child: UiText(
                                label: "Ok",
                                fontColor: Colors.white,
                              ),
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(Colors.purple.shade300)
                            ),),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete_outline)),
        ],
      ))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _products.length;

  @override
  int get selectedRowCount => 0;

  Future<void> _deleteProduct(String? docId) async {
    final _firebase = FirebaseFirestore.instance;
    try {
      await _firebase.collection("product_list").doc(docId).delete();
      _products.removeWhere((product) => product.id == docId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: UiText(
        label: "Deleted Successfully",
        fontColor: Colors.white,
      )));
      notifyListeners();

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: UiText(
        label: "Error : ${error.toString()}",
        fontColor: Colors.white,
      )));
    }
  }
}

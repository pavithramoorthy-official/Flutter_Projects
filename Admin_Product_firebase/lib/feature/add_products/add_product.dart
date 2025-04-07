import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/core/router/app_router.gr.dart';
import 'package:savings_admin/feature/provider/navigation_provider.dart';
import 'package:savings_admin/ui_components/ui_button.dart';
import 'package:savings_admin/ui_components/ui_space.dart';
import 'package:savings_admin/ui_components/ui_text.dart';
import 'package:savings_admin/ui_components/ui_textformfield.dart';
import 'package:intl/intl.dart';

import 'model/product_model.dart';

@RoutePage()
class AddProductPage extends StatefulWidget {
  const AddProductPage({
    super.key,
    this.product,
  });

  final ProductModel? product;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final GlobalKey<FormState> _productForm = GlobalKey<FormState>();
  bool _isButtonEnabled = false;
  bool isEdit = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final product = ProviderScope.containerOf(context, listen: false)
          .read(navigationProvider)
          .productModel;

      if (product != null && product.id != null) {
        print("Edit data : $product");
        nameController.text = product.productName;
        priceController.text = product.productPrice.toString() != "0" ? product.productPrice.toString() : "";
        quantityController.text = product.productQuantity.toString() != "0" ? product.productQuantity.toString() : "";
        print("name : ${nameController.text}");
        print("Id : ${product.id}");
        isEdit = true;
        }else{

      }
    });


    nameController.addListener(_updateButtonState);
    priceController.addListener(_updateButtonState);
    quantityController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    if (nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        quantityController.text.isNotEmpty) {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  void _validate() {
    if (_productForm.currentState!.validate()) {
      String formattedDate =
          DateFormat('MMMM d, yyyy h:mm a').format(DateTime.now());

      var _productData = ProductModel(
        id: widget.product?.id,
        productName: nameController.text,
        productQuantity: int.parse(quantityController.text),
        productPrice: double.parse(priceController.text),
        productDate: formattedDate,
      );
      print("_productData : " + _productData.id.toString());

      if (!isEdit) {
        _saveProductTofirebase(_productData);
      } else {
        final product = ProviderScope.containerOf(context, listen: false)
            .read(navigationProvider)
            .productModel;
        print("ID inside update : ${product!.id}");
        _productData = _productData.copyWith(
          id: product.id, // Ensure product is not null
        );
        print("Edit data sent : $_productData");
        _updateProductToFirebase(_productData);
      }
      context.router.replace(DashboardRoute());
    }
  }

  void _reset() {
    setState(() {
      nameController.clear();
      priceController.clear();
      quantityController.clear();
    });
  }

  Future<void> _saveProductTofirebase(ProductModel _productData) async {
    final _firebase = FirebaseFirestore.instance;
    try {
      DocumentReference docRef =
          await _firebase.collection("product_list").add(_productData.toJson());

      final updatedData = _productData.copyWith(id: docRef.id.toString());
      await docRef.update({'id': updatedData.id});

      _reset();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added Successfully")));
    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error ${e.toString()}")));

    }
  }

  Future<void> _updateProductToFirebase(ProductModel productmodel) async {
    final _firebase = FirebaseFirestore.instance;
    try {
      print("Update : $productmodel");
      await _firebase
          .collection("product_list")
          .doc(productmodel.id)
          .update(productmodel.toJson());
      _reset();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Updated Successfully")));
    } catch (error) {
      print("update Error : $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error is : ${error.toString()}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final product = ref.watch(navigationProvider).productModel;

      return Scaffold(
        body: _buildbody(product),
      );
    });
  }

  Widget _buildbody(ProductModel? product) {
    return Center(
      child: Form(
        key: _productForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiText(
                label: product!.id == null ? "Add Product" : "Edit Product",fontSize: 35,),
            UiSpace.vertical(20),
            UiText(label: "Product Name"),
            UiTextformfield(
              controller: nameController,
              width: 400,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter value";
                }
                return null;
              },
              onChanged: (value) {},
            ),
            UiSpace.vertical(10),
            UiText(label: "Product Price"),
            UiTextformfield(
              controller: priceController,
              width: 400,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter value";
                }
                return null;
              },
            ),
            UiSpace.vertical(10),
            UiText(label: "Product quantity"),
            UiTextformfield(
              controller: quantityController,
              width: 400,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter value";
                }
                return null;
              },
            ),
            UiSpace.vertical(10),
            UiButton(
              label: product.id == null ? "Add Product" : "Update",
              onTap: () {
                _validate();
              },
              isEnabled: _isButtonEnabled,
            )
          ],
        ),
      ),
    );
  }
}

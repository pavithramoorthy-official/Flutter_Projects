import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:savings_admin/feature/add_products/model/product_model.dart';


class ProductService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchProductList()async{
    QuerySnapshot snapshot = await _firestore.collection("product_list").get();
    return snapshot.docs.map((doc){
      final data = doc.data() as Map<String, dynamic>;
      print("DataSource : $data");
      return ProductModel.fromJson(data);
    }).toList();
  }
}
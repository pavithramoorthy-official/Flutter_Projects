import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    required String productName,
    required int productQuantity,
    required double productPrice,
    required String productDate,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> Json) =>
      _$ProductModelFromJson(Json);

}
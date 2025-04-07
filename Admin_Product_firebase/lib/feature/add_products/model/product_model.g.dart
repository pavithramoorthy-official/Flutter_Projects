// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String?,
      productName: json['productName'] as String,
      productQuantity: (json['productQuantity'] as num).toInt(),
      productPrice: (json['productPrice'] as num).toDouble(),
      productDate: json['productDate'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productQuantity': instance.productQuantity,
      'productPrice': instance.productPrice,
      'productDate': instance.productDate,
    };

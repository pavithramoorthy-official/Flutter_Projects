// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$billImpl _$$billImplFromJson(Map<String, dynamic> json) => _$billImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => billData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$billImplToJson(_$billImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$billDataImpl _$$billDataImplFromJson(Map<String, dynamic> json) =>
    _$billDataImpl(
      billNumber: json['billNumber'] as String?,
      location: json['location'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$billDataImplToJson(_$billDataImpl instance) =>
    <String, dynamic>{
      'billNumber': instance.billNumber,
      'location': instance.location,
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'date': instance.date,
    };

_$ItemListImpl _$$ItemListImplFromJson(Map<String, dynamic> json) =>
    _$ItemListImpl(
      item_name: json['item_name'] as String,
      item_quantity: (json['item_quantity'] as num).toInt(),
      item_total: (json['item_total'] as num).toDouble(),
      item_gst: (json['item_gst'] as num).toDouble(),
      item_price: (json['item_price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ItemListImplToJson(_$ItemListImpl instance) =>
    <String, dynamic>{
      'item_name': instance.item_name,
      'item_quantity': instance.item_quantity,
      'item_total': instance.item_total,
      'item_gst': instance.item_gst,
      'item_price': instance.item_price,
    };

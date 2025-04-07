
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

@freezed
class bill with _$bill{
  const factory bill({
    required List<billData> data,
}) = _bill;

  factory bill.fromJson(Map<String, dynamic> Json) => _$billFromJson(Json);

}

@freezed
class billData with _$billData{
  const factory billData({
    required String? billNumber,
    required String location,
    required List<ItemList> items,
    required double totalAmount,
    required String date,
}) = _billData;

  factory billData.fromJson(Map<String,dynamic> Json) => _$billDataFromJson(Json);
}

@freezed
class ItemList with _$ItemList{
  const factory ItemList({
    required String item_name,
    required int item_quantity,
    required double item_total,
    required double item_gst,
    required double item_price,
}) = _ItemList;

 factory ItemList.fromJson(Map<String, dynamic> json) => _$ItemListFromJson(json);

}
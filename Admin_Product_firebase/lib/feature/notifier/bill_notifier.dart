import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/model/bill_model.dart';

class BillNotifier extends StateNotifier<billData> {
  BillNotifier() : super(billData(
    billNumber: "",
    location: "",
    items: [],
    totalAmount: 0,
    date: "",));

  void updateBill(billData data) {
    state = data;
  }

  void resetInvoice(){
    state = billData(
      billNumber: "",
      location: "",
      items: [],
      totalAmount: 0,
      date: "",);

  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/feature/dashboard/model/bill_model.dart';
import 'package:savings_admin/feature/notifier/bill_notifier.dart';

final billProvider = StateNotifierProvider<BillNotifier,billData>((ref){
  return BillNotifier();
});
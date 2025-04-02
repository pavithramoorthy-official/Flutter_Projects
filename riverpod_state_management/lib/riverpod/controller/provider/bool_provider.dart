import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/riverpod/controller/notifier/bool_notifier.dart';

final boolProvider = StateNotifierProvider<BoolNotifier, bool>((ref){
  return BoolNotifier();
});
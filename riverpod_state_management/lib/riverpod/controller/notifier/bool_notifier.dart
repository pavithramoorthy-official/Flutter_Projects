import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoolNotifier extends StateNotifier<bool>{
  BoolNotifier() : super(false);
  void updateBoolValue(bool newState){
    state = newState;
  }
}
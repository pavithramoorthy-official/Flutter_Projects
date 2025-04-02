import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StringNotifier extends StateNotifier<String>{
  StringNotifier() : super ('Earth'); // initializes value
  void updateString(String newString){
    state = newString;
  }
}
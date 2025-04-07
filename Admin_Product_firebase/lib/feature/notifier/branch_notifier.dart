import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BranchNotifier extends StateNotifier<String>{
  BranchNotifier() : super("India");

  void updateLocation(selectedLocation){
    state = selectedLocation;
  }
}
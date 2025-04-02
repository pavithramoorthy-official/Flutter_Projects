import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListNotifier extends StateNotifier<List>{
  ListNotifier() : super([]);

  void updateList(updateListData){
    state = updateListData;
  }
}
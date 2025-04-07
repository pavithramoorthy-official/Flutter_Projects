import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchDashBoardNotifer extends StateNotifier<String?>{
  SearchDashBoardNotifer() : super('');

  void SearchText(String? text){
    state = text;
  }

}
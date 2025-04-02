import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapNotifier extends StateNotifier<Map>{
  MapNotifier() : super({});

  void updateMap(String key, String value){
    state = {...state, key:value};
  }
}
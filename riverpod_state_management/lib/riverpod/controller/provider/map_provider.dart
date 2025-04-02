import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/riverpod/controller/notifier/map_notifier.dart';

final mapProvider = StateNotifierProvider<MapNotifier, Map>((ref){
  return MapNotifier();
});
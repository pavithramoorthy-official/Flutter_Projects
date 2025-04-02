import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/riverpod/controller/notifier/list_notifier.dart';

final listProvider = StateNotifierProvider<ListNotifier, List>((ref){
  return ListNotifier();
});
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/riverpod/controller/notifier/string_notifier.dart';

final StringProvider = StateNotifierProvider<StringNotifier, String>((ref){
  return StringNotifier();
});


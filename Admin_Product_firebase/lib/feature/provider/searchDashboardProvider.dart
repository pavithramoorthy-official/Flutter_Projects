import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/feature/notifier/searchDashboardNotifier.dart';

final searchDashboardProvider = StateNotifierProvider<SearchDashBoardNotifer, String?>((ref){
  return SearchDashBoardNotifer();
});
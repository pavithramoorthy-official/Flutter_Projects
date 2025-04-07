import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/feature/notifier/branch_notifier.dart';

//initializing with null value
final selectedBranchProvider = StateNotifierProvider<BranchNotifier, String>((ref) {
  return BranchNotifier();
});
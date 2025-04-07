import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/feature/notifier/navigation_notifier.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier,NavigationState>((ref){
  return NavigationNotifier();
});
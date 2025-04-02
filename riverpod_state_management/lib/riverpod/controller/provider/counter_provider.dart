import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/counter_notifier.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider.autoDispose<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../local/share_provider.dart';

class PlanViewModel extends StateNotifier<String> {
  PlanViewModel(this.sharedPreferences)
      : super(
    sharedPreferences?.getString("plan") ?? "",
  );

  final SharedPreferences? sharedPreferences;

  Future<void> addPLan(String plan) async {
    state = plan;
    sharedPreferences!.setString("plan", plan);
  }

  Future<void> deleteCurrentPlan() async {
    state = "";
    sharedPreferences!.setString("plan", "");
  }
}

final planProvider = StateNotifierProvider<PlanViewModel, String>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).value;
  return PlanViewModel(sharedPreferences);
});
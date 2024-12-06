import 'dart:ui';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../local/share_provider.dart';

class LocaleViewModel extends StateNotifier<Locale> {
  LocaleViewModel(this.sharedPreferences)
      : super(
          Locale(
            sharedPreferences?.getString("locale") ?? "en",
          ),
        );

  final SharedPreferences? sharedPreferences;

  Future<void> changeLanguage(String lan) async {
    Locale locale = Locale(lan);
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    state = Locale(lan);
    sharedPreferences!.setString("locale", lan);
  }
}

final localeProvider = StateNotifierProvider<LocaleViewModel, Locale>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).value;
  return LocaleViewModel(sharedPreferences);
});

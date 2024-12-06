import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/features/app/presentation/view_models/locale_viewmodel.dart';

import 'core/constants/route_manager.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: RouteGenerator.instance.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ref.read(localeProvider),
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.appBackground,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
    );
  }
}

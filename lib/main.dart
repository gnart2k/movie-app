import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/features/app/presentation/view_models/locale_viewmodel.dart';
import 'package:movie_app/features/home/subscription_page/presentation/views/subscription_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';
import 'package:movie_app/features/movie_open_page/presentation/views/movies_open_page.dart';

import 'features/movie_and_show/presentation/views/movie_and_show_page.dart';
import 'features/movie_open_page/presentation/views/movies_open_page.dart';
import 'features/show_page_open/views/show_page_open.dart';
import 'features/support_page/presentation/views/support_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeViewModel = ref.watch(localeProvider);
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: ref.read(localeProvider),
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.appBackground,
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        // home: MovieOpenPage());
        // home: MovieAndShowPage());
        // home: const SupportPage());
        // home: HomeScreen());
        home: const HomeScreen());

    // home: const SupportPage());
  }
}

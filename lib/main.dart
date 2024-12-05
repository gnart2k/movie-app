import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/features/app/presentation/view_models/locale_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/features/home/presentation/view_models/auth_viewmodel.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';
import 'package:movie_app/features/home/presentation/views/login_screen.dart';



void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeViewModel = ref.watch(localeProvider);
    final authViewModel = ref.watch(authViewModelProvider);
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
        home: authViewModel.isAuthenticated ? const HomeScreen() : const LoginScreen(),
        );

    // home: const SupportPage());
  }
}

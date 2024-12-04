import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';

import 'features/movie_and_show/presentation/views/movie_and_show_page.dart';
import 'features/show_page_open/views/show_page_open.dart';
import 'features/support_page/presentation/views/support_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.appBackground,
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        // home: MovieOpenPage());
        // home: MovieAndShowPage());
        // home: const SupportPage());
        home: const MovieAndShowPage());

    // home: const SupportPage());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';
import 'package:movie_app/features/movie_and_show/presentation/views/movie_and_show_page.dart';

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
        home: const HomeScreen());
    // home: MovieAndShowPage());
  }
}

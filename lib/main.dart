import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';
import 'package:movie_app/features/movie_open_page/presentation/views/movies_open_page.dart';

void main() {
  runApp(const MainApp());
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
        home: MovieOpenPage());
    // home: MovieAndShowPage());
  }
}
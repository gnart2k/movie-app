import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BannerWidget(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: const Column(
                      children: [
                        FreeTrialWidget(),
                      ],
                    ),
                  ),
                  const FooterWidget(),
                ],
              ),
            ),
          ),
          const HeaderWidgets(),
        ],
      ),
    );
  }
}

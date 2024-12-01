import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';

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
                  SizedBox(
                    child: Column(
                      children: [
                        const FreeTrialWidget(),
                        FrequentlyAskedQuestionsWidget()
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

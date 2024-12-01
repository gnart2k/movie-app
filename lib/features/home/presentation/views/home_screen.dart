import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';

import '../../../../core/widgets/category/category_slider_container.dart';
import 'package:movie_app/features/home/presentation/widgets/multiplatform_widget.dart';

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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: CategorySliderContainer(
                      title: "Explore our wide variety of categories",
                      subTitle:
                          "Whether you're looking for a comedy to make you laugh, a drama to make you think, or a documentary to learn something new",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                  const BannerWidget(),
                  SizedBox(
                    child: Column(
                      children: [
                        const FreeTrialWidget(),
                        FrequentlyAskedQuestionsWidget()
                        const MultiPlatformWidget(),
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

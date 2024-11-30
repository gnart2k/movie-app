import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:movie_app/core/widgets/button/icon_button.dart';
import 'package:movie_app/core/widgets/button/language_switcher.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';

import '../../../../core/widgets/category/category_slider_container.dart';

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
                  BannerWidget(),
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
                    child: Column(
                      children: [
                        const FreeTrialWidget(),
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

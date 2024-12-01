import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';
import '../../../../core/widgets/category/category_slider_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const BannerWidget(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 160),
                  child: CategorySliderContainer(
                    movieList: [
                      [
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                      ],
                      [
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                      ],
                      [
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'fsaf', imageUrl: AppImages.categoryImage),
                      ],
                    ],
                    title: "Explore our wide variety of categories",
                    subTitle:
                        "Whether you're looking for a comedy to make you laugh, a drama to make you think, or a documentary to learn something new",
                  ),
                ),
                Column(
                  children: [
                    const FreeTrialWidget(),
                    FrequentlyAskedQuestionsWidget(),
                  ],
                ),
                const FooterWidget(),
              ],
            ),
          ),
          const HeaderWidgets(),
        ],
      ),
    );
  }
}


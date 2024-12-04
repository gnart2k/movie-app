import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/category/category_card.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';
import '../../../../core/widgets/category/category_slider_container.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(children: [
            const BannerWidget(),
            const SizedBox(height: 200),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Column(
                children: [
                  CategorySliderContainer<MovieModel>(
                    cardWidgetBuilder: (movie, int itemNum) {
                      return CategoryCard(
                          title: movie.name,
                          imageUrl: movie.imageUrl,
                          itemNumber: itemNum);
                    },
                    list: [
                      [
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                      ],
                      [
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                      ],
                      [
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                        MovieModel(
                            name: 'Adventure',
                            imageUrl: AppImages.categoryImage),
                      ]
                    ],
                    title: "Explore our wide variety of categories",
                    subTitle:
                        "Whether you're looking for a comedy to make you laugh, a drama to make you think, or a documentary to learn something new",
                    heightCard: 290,
                  ),
                  const SizedBox(height: 120),
                  FrequentlyAskedQuestionsWidget(),
                  const FreeTrialWidget(),
                ],
              ),
            ),
            const FooterWidget(),
          ])),
          const HeaderWidgets(),
        ],
      ),
    );
  }
}

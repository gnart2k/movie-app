import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/category/category_card.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/core/widgets/movie/movie_card.dart';
import 'package:movie_app/core/widgets/plan/plan_container.dart'
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
                CategorySliderContainer(
                  cardWidgetBuilder: (movie) {
                    return CategoryCard(
                        title: movie.name, imageUrl: movie.imageUrl);
                  },
                  movieList: [
                    [
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                    ],
                    [
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                    ],
                    [
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                      MovieModel(
                          name: 'Adventure', imageUrl: AppImages.categoryImage),
                    ],
                    title: "Explore our wide variety of categories",
                    subTitle:
                        "Whether you're looking for a comedy to make you laugh, a drama to make you think, or a documentary to learn something new",
                    heightCard: 290,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(210, 100, 210, 50),
                  child: CategorySliderContainer(
                    cardWidgetBuilder: (movie) {
                      return MoviesCard(
                        title: movie.name,
                        imageUrl: movie.imageUrl,
                        width: 290.6,
                        height: 400,
                        hour: '1h 10min',
                        isRating: false,
                       textViewRight: '20k',
                      );
                    },
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
                            name: 'fsaf', imageUrl: AppImages.categoryImage)
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
                            name: 'fsaf', imageUrl: AppImages.categoryImage)
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
                            name: 'fsaf', imageUrl: AppImages.categoryImage)
                      ],
                    ],
                    title: "Trending Now",
                    subTitle: '',
                    heightCard: 400,

                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(210, 100, 210, 50),
                  child: CategorySliderContainer(
                    cardWidgetBuilder: (movie) {
                      return MoviesCard(
                        title: movie.name,
                        imageUrl: movie.imageUrl,
                        width: 359.5,
                        height: 500,
                        hour: '1h 57min',
                        textViewRight: '20K',
                        isRating: true,
                      );
                    },
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
                      ],
                    ],
                    title: "Must - Watch Movies",
                    subTitle: '',
                    heightCard: 500,
                    
                  ),
                ),
                
                const SizedBox(height: 10,),
                PlanContainer(plans: [
                  PlanModel(title: "Basic plan", description: "Enjoy an extensive library of movies and shows, featuring a range of content, including recently released titles.", price: 9.99),
                  PlanModel(title: "Standard plan", description: "Enjoy an extensive library of movies and shows, featuring a range of content, including recently released titles.", price: 9.99),
                  PlanModel(title: "Premium plan", description: "Enjoy an extensive library of movies and shows, featuring a range of content, including recently released titles.", price: 9.99)
                ]),
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

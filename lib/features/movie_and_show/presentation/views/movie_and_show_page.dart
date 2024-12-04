import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/core/widgets/movie/movie_card.dart';
import 'package:movie_app/features/movie_and_show/presentation/widgets/movie_slider_container.dart';

import '../../../../core/widgets/category/category_card.dart';
import '../../../../core/widgets/category/category_slider_container.dart';
import '../../../../core/widgets/footer_widget.dart';
import '../../../home/presentation/widgets/free_trial_widget.dart';
import '../widgets/movie_category_container.dart';

class MovieAndShowPage extends StatelessWidget {
  const MovieAndShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(children: [
                    MovieSliderContainer(movieList: [
                      MovieModel(
                          name: 'Avengers : Endgame',
                          description:
                              "With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos's actions and undo the chaos to the universe, no matter what consequences may be in store, and no matter who they face... Avenge the fallen.",
                          imageUrl: AppImages.movieBanner),
                      MovieModel(
                          name: 'fsaf',
                          imageUrl: AppImages.movieBanner,
                          description:
                              "With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos's actions and undo the chaos to the universe, no matter what consequences may be in store, and no matter who they face... Avenge the fallen."),
                      MovieModel(name: 'fsaf', imageUrl: AppImages.movieBanner),
                      MovieModel(name: 'fsaf', imageUrl: AppImages.movieBanner),
                      MovieModel(name: 'fsaf', imageUrl: AppImages.movieBanner),
                      MovieModel(name: 'fsaf', imageUrl: AppImages.movieBanner),
                    ]),
                    MovieCategoryContainer(
                      title: "Movie",
                      childWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategorySliderContainer(
                            cardWidgetBuilder: (movie, int itemNum) {
                              return CategoryCard(
                                  title: movie.name,
                                  imageUrl: movie.imageUrl,
                                  itemNumber: itemNum);
                            },
                            movieList: [
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
                            title: "Our Genre",
                            heightCard: 290,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          CategorySliderContainer(
                            cardWidgetBuilder: (movie, int itemNum) {
                              return CategoryCard(
                                title: movie.name,
                                imageUrl: movie.imageUrl,
                                itemNumber: itemNum,
                                onTop: true,
                                onTopTitle: "Top 10 in",
                              );
                            },
                            movieList: [
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
                            title: "Popular Top 10 In Genres",
                            heightCard: 290,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          CategorySliderContainer(
                            cardWidgetBuilder: (movie, int itemNum) {
                              return MoviesCard(
                                title: movie.name,
                                imageUrl: movie.imageUrl,
                                hour: "1h30min",
                                textViewRight: "1.4k",
                                isRating: false,
                              );
                            },
                            movieList: [
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
                            title: "Must - Watch Movies",
                            heightCard: 350,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          CategorySliderContainer(
                            cardWidgetBuilder: (movie, int itemNum) {
                              return MoviesCard(
                                title: movie.name,
                                releasedTitle: "Released at 22 April 2023",
                                imageUrl: movie.imageUrl,
                              );
                            },
                            movieList: [
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
                            title: "New Released Shows",
                            heightCard: 350,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          CategorySliderContainer(
                            cardWidgetBuilder: (movie, int itemNum) {
                              return MoviesCard(
                                title: movie.name,
                                imageUrl: movie.imageUrl,
                                hour: "1h30min",
                                textViewRight: "20k",
                                isRating: true,
                              );
                            },
                            movieList: [
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
                            title: "Must - Watch Movies",
                            heightCard: 350,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const FreeTrialWidget(),
                  ]),
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

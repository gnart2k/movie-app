import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/constants/route_manager.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/core/widgets/movie/movie_card.dart';
import 'package:movie_app/features/home/presentation/view_models/show_page/section_movies_viewmodel.dart';
import 'package:movie_app/features/movie_and_show/presentation/widgets/movie_category_container.dart';

import '../../../../core/widgets/banner/movie_detail_banner.dart';
import '../../../../core/widgets/category/category_card.dart';
import '../../../../core/widgets/category/category_slider_container.dart';
import '../../../../core/widgets/footer_widget.dart';
import '../../../home/presentation/widgets/free_trial_widget.dart';
import '../widgets/movie_category_container.dart';

class MovieAndShowPage extends StatelessWidget {
  const MovieAndShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        mainAxisSize: MainAxisSize.max,
            children: [
        MovieBigBanner(),
        const SizedBox(
          height: 100,
        ),
        MovieCategoryContainer(
          title: "Movie",
          childWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategorySliderContainer<MovieModel>(
                cardWidgetBuilder: (item, int itemNum) {
                  return CategoryCard(
                      title: item.name,
                      imageUrl: item.imageUrl,
                      itemNumber: itemNum);
                },
                list: [
                  [
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
                  ]
                ],
                title: "Our Genre",
                heightCard: 290,
              ),
              const SizedBox(
                height: 100,
              ),
              CategorySliderContainer<MovieModel>(
                cardWidgetBuilder: (movie, int itemNum) {
                  return CategoryCard(
                    title: movie.name,
                    imageUrl: movie.imageUrl,
                    itemNumber: itemNum,
                    onTop: true,
                    onTopTitle: "Top 10 in",
                  );
                },
                list: [
                  [
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
                  ]
                ],
                title: "Popular Top 10 In Genres",
                heightCard: 290,
              ),
              const SizedBox(
                height: 100,
              ),
              CategorySliderContainer<MovieModel>(
                cardWidgetBuilder: (movie, int itemNum) {
                  return MoviesCard(
                    title: movie.name,
                    imageUrl: movie.imageUrl,
                    hour: "1h30min",
                    textViewRight: "1.4k",
                    isRating: false,
                    onTap: () {
                      context.goNamed("movieOpen", pathParameters: {'id': "1"});
                    },
                  );
                },
                list: [
                  [
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
                  ]
                ],
                title: "Must - Watch Movies",
                heightCard: 350,
              ),
              const SizedBox(
                height: 100,
              ),
              CategorySliderContainer<MovieModel>(
                cardWidgetBuilder: (movie, int itemNum) {
                  return MoviesCard(
                    title: movie.name,
                    releasedTitle: "Released at 22 April 2023",
                    imageUrl: movie.imageUrl,
                    onTap: () {
                      context.goNamed("movieOpen", pathParameters: {'id': "1"});
                    },
                  );
                },
                list: [
                  [
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
                  ]
                ],
                title: "New Released Shows",
                heightCard: 350,
              ),
              const SizedBox(
                height: 100,
              ),
              CategorySliderContainer<MovieModel>(
                cardWidgetBuilder: (movie, int itemNum) {
                  return MoviesCard(
                    title: movie.name,
                    imageUrl: movie.imageUrl,
                    hour: "1h30min",
                    textViewRight: "20k",
                    isRating: true,
                    onTap: () {
                      context.goNamed("showOpen", pathParameters: {'id': "1"});
                    },
                  );
                },
                list: [
                  [
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
    );
  }
}

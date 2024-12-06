import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/widgets/movie/movie_card.dart';
import 'package:movie_app/features/home/presentation/view_models/show_page/section_movies_viewmodel.dart';
import 'package:movie_app/features/movie_and_show/presentation/widgets/movie_category_container.dart';

import '../../../../core/widgets/banner/movie_detail_banner.dart';
import '../../../../core/widgets/category/category_card.dart';
import '../../../../core/widgets/category/category_slider_container.dart';
import '../../../home/presentation/widgets/free_trial_widget.dart';

class MovieAndShowPage extends StatelessWidget {
  const MovieAndShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(children: [
            MovieBigBanner(
              onTap: () {},
            ),
            const SizedBox(
              height: 100,
            ),
            const MovieCategoryContainer(
              title: "Movies",
              childWidget: MovieCategory(
                isMovies: true,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const MovieCategoryContainer(
              title: "Shows",
              childWidget: MovieCategory(
                isMovies: false,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const FreeTrialWidget(),
          ]),
        ),
      ],
    );
  }
}

class MovieCategory extends ConsumerStatefulWidget {
  const MovieCategory({super.key, required this.isMovies});
  final bool isMovies;
  @override
  MovieCategoryContainerState createState() => MovieCategoryContainerState();
}

class MovieCategoryContainerState extends ConsumerState<MovieCategory> {
  late List<List<MovieModel>> genresLists;

  late List<List<MovieModel>> moviesLists;

  late List<List<MovieModel>> mustWatchLists;

  @override
  void initState() {
    super.initState();
    ref.read(sectionMoviesViewModelProvider.notifier).getSectionMovies();
  }

  @override
  Widget build(BuildContext context) {
    final moviesState = ref.watch(sectionMoviesViewModelProvider);

    if (moviesState.sectionMoviesList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return _widget(moviesState);
  }

  Widget _widget(SectionMovies moviesState) {
    List<MovieModel> genresList = [
      MovieModel(
          name: moviesState.sectionMoviesList[0].genres?[0] ?? '',
          imageUrl: AppImages.categoryImage),
      MovieModel(
          name: moviesState.sectionMoviesList[0].genres?[1] ?? '',
          imageUrl: AppImages.categoryImage),
      MovieModel(
          name: moviesState.sectionMoviesList[0].genres?[2] ?? '',
          imageUrl: AppImages.categoryImage),
      MovieModel(
          name: moviesState.sectionMoviesList[0].genres?[3] ?? '',
          imageUrl: AppImages.categoryImage),
    ];

    genresLists = [genresList, genresList, genresList];

    List<MovieModel> moviesList = [
      MovieModel(name: '', imageUrl: AppImages.categoryImage),
      MovieModel(name: '', imageUrl: AppImages.categoryImage),
      MovieModel(name: '', imageUrl: AppImages.categoryImage),
      MovieModel(name: '', imageUrl: AppImages.categoryImage),
      MovieModel(name: '', imageUrl: AppImages.categoryImage)
    ];

    List<List<MovieModel>> moviesLists = [moviesList, moviesList, moviesList];

    List<MovieModel> mustWatchList = [
      MovieModel(name: '', imageUrl: AppImages.categoryImage),
      MovieModel(name: '', imageUrl: AppImages.categoryImage),
      MovieModel(name: '', imageUrl: AppImages.categoryImage),
      MovieModel(name: '', imageUrl: AppImages.categoryImage)
    ];
    mustWatchLists = [mustWatchList, mustWatchList, mustWatchList];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategorySliderContainer<MovieModel>(
          cardWidgetBuilder: (item, int itemNum) {
            return CategoryCard(
              title: item.name,
              imageUrl: item.imageUrl,
              itemNumber: itemNum,
            );
          },
          list: genresLists, // both popular
          title: moviesState.sectionMoviesList[0].title,
          heightCard: 290,
        ),
        const SizedBox(height: 100),
        CategorySliderContainer<MovieModel>(
          cardWidgetBuilder: (item, int itemNum) {
            return CategoryCard(
              title: item.name,
              imageUrl: item.imageUrl,
              itemNumber: itemNum,
              onTopTitle: 'Top 10 In',
              onTop: true,
            );
          },
          list: genresLists,
          title: moviesState.sectionMoviesList[1].title,
          heightCard: 290,
        ),
        const SizedBox(height: 100),
        CategorySliderContainer<MovieModel>(
          cardWidgetBuilder: (movie, int itemNum) {
            return MoviesCard(
              title: movie.name,
              imageUrl: movie.imageUrl,
              hour: "1h30min",
              textViewRight: "1.4k",
              isRating: false,
              onTap: () {
                context.goNamed("showOpen", pathParameters: {'id': "1"});
              },
            );
          },
          list: moviesLists,
          title: moviesState.sectionMoviesList[widget.isMovies ? 2 : 5].title,
          heightCard: 350,
        ),
        const SizedBox(height: 100),
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
          list: moviesLists,
          title: moviesState.sectionMoviesList[widget.isMovies ? 3 : 6].title,
          heightCard: 350,
        ),
        const SizedBox(height: 100),
        CategorySliderContainer<MovieModel>(
          cardWidgetBuilder: (movie, int itemNum) {
            return MoviesCard(
              title: movie.name,
              imageUrl: movie.imageUrl,
              hour: "1h30min",
              textViewRight: "20k",
              isRating: true,
              onTap: () {
                context.goNamed("movieOpen", pathParameters: {'id': "1"});
              },
            );
          },
          list: mustWatchLists,
          title: moviesState.sectionMoviesList[widget.isMovies ? 4 : 7].title,
          heightCard: 450,
        ),
      ],
    );
  }
}

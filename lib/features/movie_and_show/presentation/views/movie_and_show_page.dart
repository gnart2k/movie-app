import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/movie_and_show/presentation/widgets/movie_slider_container.dart';

class MovieAndShowPage extends StatelessWidget {
  const MovieAndShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Column(children: [
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
            ])
          ]),
        ],
      )),
      const HeaderWidgets(),
    ]));
  }
}

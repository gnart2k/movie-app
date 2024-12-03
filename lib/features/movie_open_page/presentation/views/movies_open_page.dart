import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/model/cast_model.dart';
import 'package:movie_app/core/domain/model/review_model.dart';
import 'package:movie_app/features/movie_open_page/presentation/widgets/cast_container.dart';
import 'package:movie_app/features/movie_open_page/presentation/widgets/description_container.dart';
import 'package:movie_app/features/movie_open_page/presentation/widgets/review_container.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/domain/model/movie_model.dart';
import '../../../../core/widgets/footer_widget.dart';
import '../../../../core/widgets/header_widgets.dart';
import '../../../../core/widgets/search/search_text_field.dart';
import '../../../home/presentation/widgets/free_trial_widget.dart';
import '../../../movie_and_show/presentation/widgets/movie_slider_container.dart';
import '../widgets/movie_information_widget.dart';

class MovieOpenPage extends StatelessWidget {
  MovieOpenPage({super.key});

  List<List<CastModel>> casts = [
    [
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
    ],
    [
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
      CastModel(name: "linh", imageUrl: AppImages.characterImage),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                MovieSliderContainer(movieList: [
                  MovieModel(
                      name: 'Avengers : Endgame',
                      description:
                          "With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos's actions and undo the chaos to the universe, no matter what consequences may be in store, and no matter who they face... Avenge the fallen.",
                      imageUrl: AppImages.movieBanner),
                  MovieModel(
                      name: 'Avengers : Endgame',
                      imageUrl: AppImages.movieBanner,
                      description:
                          "With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos's actions and undo the chaos to the universe, no matter what consequences may be in store, and no matter who they face... Avenge the fallen."),
                  MovieModel(
                      name: 'Avengers : Endgame',
                      imageUrl: AppImages.movieBanner),
                  MovieModel(
                      name: 'Avengers : Endgame',
                      imageUrl: AppImages.movieBanner),
                  MovieModel(
                      name: 'Avengers : Endgame',
                      imageUrl: AppImages.movieBanner),
                  MovieModel(
                      name: 'Avengers : Endgame',
                      imageUrl: AppImages.movieBanner),
                ])
              ]),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 6,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const DescriptionContainer(
                                    description:
                                        "A fiery young man clashes with an unflinching forest officer in a south Indian village where spirituality, fate and folklore rule the lands."),
                                const SizedBox(
                                  height: 20,
                                ),
                                CastContainer(casts: casts),
                                const SizedBox(
                                  height: 20,
                                ),
                                ReviewContainer(
                                  reviewList: [
                                    ReviewModel(
                                        name: 'Aniket Roy',
                                        location: 'From India',
                                        reviewText:
                                            'This movie was recommended to me by a very dear friend who went for the movie by herself. I went to the cinemas to watch but had a houseful board so couldn’t watch it.',
                                        rating: 4.5),
                                    ReviewModel(
                                        name: 'Swaraj',
                                        location: 'From India',
                                        reviewText:
                                            'A restless king promises his lands to the local tribals in exchange of a stone (Panjurli, a deity of Keradi Village) wherein he finds solace and peace of mind.',
                                        rating: 5),
                                    ReviewModel(
                                        name: 'Aniket Roy',
                                        location: 'From India',
                                        reviewText:
                                            'This movie was recommended to me by a very dear friend who went for the movie by herself. I went to the cinemas to watch but had a houseful board so couldn’t watch it.',
                                        rating: 4.5),
                                    ReviewModel(
                                        name: 'Swaraj',
                                        location: 'From India',
                                        reviewText:
                                            'A restless king promises his lands to the local tribals in exchange of a stone (Panjurli, a deity of Keradi Village) wherein he finds solace and peace of mind.',
                                        rating: 5),
                                    ReviewModel(
                                        name: 'Aniket Roy',
                                        location: 'From India',
                                        reviewText:
                                            'This movie was recommended to me by a very dear friend who went for the movie by herself. I went to the cinemas to watch but had a houseful board so couldn’t watch it.',
                                        rating: 4.5),
                                    ReviewModel(
                                        name: 'Swaraj',
                                        location: 'From India',
                                        reviewText:
                                            'A restless king promises his lands to the local tribals in exchange of a stone (Panjurli, a deity of Keradi Village) wherein he finds solace and peace of mind.',
                                        rating: 5),
                                    ReviewModel(
                                        name: 'Aniket Roy',
                                        location: 'From India',
                                        reviewText:
                                            'This movie was recommended to me by a very dear friend who went for the movie by herself. I went to the cinemas to watch but had a houseful board so couldn’t watch it.',
                                        rating: 4.5),
                                    ReviewModel(
                                        name: 'Swaraj',
                                        location: 'From India',
                                        reviewText:
                                            'A restless king promises his lands to the local tribals in exchange of a stone (Panjurli, a deity of Keradi Village) wherein he finds solace and peace of mind.',
                                        rating: 5),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            flex: 4,
                            child: Container(
                              child: MovieInformation(),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FreeTrialWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 120),
              const FooterWidget(),
            ],
          )),
          const HeaderWidgets(),
        ],
      ),
    );
  }
}

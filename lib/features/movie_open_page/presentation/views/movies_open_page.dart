import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/cast_model.dart';
import 'package:movie_app/core/domain/model/review_model.dart';
import 'package:movie_app/core/helpers/converter.dart';
import 'package:movie_app/core/widgets/banner/movie_detail_banner.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/movie_and_show/presentation/widgets/movie_information_widget.dart';
import 'package:movie_app/features/movie_open_page/presentation/view_models/movie_view_model.dart';
import 'package:movie_app/features/movie_open_page/presentation/widgets/cast_container.dart';
import 'package:movie_app/features/movie_open_page/presentation/widgets/description_container.dart';
import 'package:movie_app/features/movie_open_page/presentation/widgets/review_container.dart';

class MovieOpenPage extends ConsumerWidget {
  MovieOpenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieProps = ref.watch(movieViewModelProvider);

    if (movieProps.movieSection.buttons.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieBigBanner(),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DescriptionContainer(
                                description:
                                    movieProps.movieSection.description,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (movieProps.castSection.castMembers.isNotEmpty)
                                CastContainer(
                                    casts: convertTo2DArray(
                                        movieProps.castSection.castMembers
                                            .map((e) => CastModel(
                                                name: e.name,
                                                imageUrl:
                                                    AppImages.characterImage))
                                            .toList(),
                                        5),
                                    heightCard: 220),
                              const SizedBox(
                                height: 20,
                              ),
                              ReviewContainer(
                                reviewList: movieProps.reviewsSection.reviews
                                    .map((e) => ReviewModel(
                                        name: e.author,
                                        location: e.location,
                                        rating: e.rating,
                                        reviewText: e.comment))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(flex: 4, child: MovieInformation())
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FreeTrialWidget(),
                  ],
                ),
                const SizedBox(height: 120),
                const FooterWidget(),
              ],
            ),
          )),
          const HeaderWidgets(),
        ],
      ),
    );
  }
}

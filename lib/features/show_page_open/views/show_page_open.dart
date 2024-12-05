import 'package:flutter/material.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/domain/model/cast_model.dart';
import '../../../core/domain/model/review_model.dart';
import '../../../core/widgets/banner/movie_detail_banner.dart';
import '../../../core/widgets/footer_widget.dart';
import '../../home/presentation/widgets/free_trial_widget.dart';
import '../../movie_open_page/presentation/widgets/cast_container.dart';
import '../../movie_open_page/presentation/widgets/description_container.dart';
import '../../movie_open_page/presentation/widgets/movie_information_widget.dart';
import '../../movie_open_page/presentation/widgets/review_container.dart';
import '../../movie_open_page/presentation/widgets/season_episodes_container.dart';

class ShowPageOpenPage extends StatelessWidget {
  ShowPageOpenPage({super.key, required this.id});

  final String id;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieBigBanner(),
          const SizedBox(height: 100,),
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
                        const SeasonEpisodesContainer(),
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
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      flex: 4,
                      child: MovieInformation())
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
    );
  }
  
}
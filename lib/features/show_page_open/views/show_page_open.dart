import 'package:flutter/material.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/domain/model/cast_model.dart';
import '../../../core/widgets/banner/movie_detail_banner.dart';
import '../../home/presentation/widgets/free_trial_widget.dart';
import '../../movie_open_page/presentation/widgets/cast_container.dart';
import '../../movie_open_page/presentation/widgets/description_container.dart';
import '../../movie_open_page/presentation/widgets/movie_information_widget.dart';
import '../../movie_open_page/presentation/widgets/review_container.dart';
import '../../movie_open_page/presentation/widgets/season_episodes_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowPageOpenPage extends StatefulWidget {
  const ShowPageOpenPage({super.key, required this.id});

  final String id;

  @override
  State<ShowPageOpenPage> createState() => _ShowPageOpenPageState();
}

class _ShowPageOpenPageState extends State<ShowPageOpenPage> {
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
          MovieBigBanner(
            onTap: () {},
          ),
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
                        const SeasonEpisodesContainer(),
                         const SizedBox(height: 50,),
                         DescriptionContainer(
                            description:
                            AppLocalizations.of(context)!.app_description),
                        const SizedBox(
                          height: 50,
                        ),
                        CastContainer(casts: casts),
                        const SizedBox(
                          height: 50,
                        ),
                        const ReviewContainer(),
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
        ],
      ),
    );
  }
}

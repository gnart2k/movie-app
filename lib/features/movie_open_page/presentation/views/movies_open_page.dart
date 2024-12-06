import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/domain/model/cast_model.dart';
import '../../../../core/widgets/banner/movie_detail_banner.dart';
import '../../../../core/widgets/dialog/custom_dialog.dart';
import '../../../home/presentation/widgets/free_trial_widget.dart';
import '../../../movie_and_show/presentation/view_models/movie_watching_viewmodel.dart';
import '../../../movie_and_show/presentation/widgets/movie_information_widget.dart';
import '../view_models/movie_view_model.dart';
import '../widgets/cast_container.dart';
import '../widgets/description_container.dart';
import '../widgets/review_container.dart';

// ignore: must_be_immutable
class MovieOpenPage extends ConsumerWidget {
  MovieOpenPage({super.key, required this.id});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final movieProps = ref.watch(movieViewModelProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieBigBanner(onTap: () {
            ref.read(movieWatchingProvider.notifier).toggleMovieList(MovieModel(
                name: movieProps.movieSection.title,
                imageUrl: AppImages.movieBanner));
            showDialog(
              context: context,
              builder: (context) => CustomDialog(
                title: AppLocalizations.of(context)!.add_movie_success,
                message: AppLocalizations.of(context)!.you_just_add,
                isSuccess: true,
                onOkPressed: () {
                  Navigator.of(context).pop();
                },
                onCancelPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            );
          }),
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
                            AppLocalizations.of(context)!.app_description),
                        const SizedBox(
                          height: 20,
                        ),
                        CastContainer(casts: casts),
                        const SizedBox(
                          height: 20,
                        ),
                        const ReviewContainer()
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
                height: 50,
              ),
              const FreeTrialWidget(),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

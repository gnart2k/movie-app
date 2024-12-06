import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/helpers/converter.dart';
import 'package:movie_app/core/widgets/category/category_card.dart';
import 'package:movie_app/core/widgets/category/category_slider_container.dart';
import 'package:movie_app/core/widgets/plan/plan_container.dart';
import 'package:movie_app/features/home/presentation/view_models/home_view_model.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/multiplatform_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProps = ref.watch(homeViewModelProvider);

    if (homeProps.contentCategories.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final movies = convertTo2DArray(
      homeProps.contentCategories
          .map((e) =>
              MovieModel(name: e.name, imageUrl: AppImages.categoryImage))
          .toList(),
      5,
    );

    final plans = homeProps.subscriptionPlans.plans
        .map((e) => PlanModel(
            title: e.name,
            price: double.parse(e.price),
            description:
                'Access to a wider selection of movies and shows, including most new releases and exclusive content'))
        .toList();

    return Column(
      children: [
        const BannerWidget(),
        const SizedBox(height: 200),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 160),
          child: Column(
            children: [
              CategorySliderContainer<MovieModel>(
                cardWidgetBuilder: (movie, int itemNum) {
                  return CategoryCard(
                    title: movie.name,
                    imageUrl: movie.imageUrl,
                    itemNumber: itemNum,
                  );
                },
                list: movies,
                title: AppLocalizations.of(context)!
                    .explore_our_wide_variety_of_categories,
                subTitle:
                    "Whether you're looking for a comedy to make you laugh, a drama to make you think, or a documentary to learn something new",
                heightCard: 290,
              ),
              const SizedBox(height: 120),
              const MultiPlatformWidget(),
              const SizedBox(height: 120),
              const FrequentlyAskedQuestionsWidget(),
              const SizedBox(height: 120),
              PlanContainer(plans: plans),
              const SizedBox(height: 120),
              const FreeTrialWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

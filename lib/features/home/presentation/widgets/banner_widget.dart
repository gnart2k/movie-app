import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/constants/app_vectors.dart';
import 'package:movie_app/core/widgets/button/icon_button.dart';
import 'package:movie_app/features/home/presentation/view_models/home_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BannerWidget extends ConsumerWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProps = ref.watch(homeViewModelProvider);

    return Column(
      children: [
        const SizedBox(height: 48),
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.bannerBackground))),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 120.0),
                child: SvgPicture.asset(AppVectors.playButton),
              ),
              const SizedBox(height: 32),
              Text(homeProps.deviceCompatibilitiy.title),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: Text(
                  textAlign: TextAlign.center,
                  // homeProps.banner.title,

                  AppLocalizations.of(context)!.the_best_stream_experience,
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
              ),
            ])),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: const Text(
              textAlign: TextAlign.center,
              'StreamVibe is the best streaming experience for watching your favorite movies and shows on demand, anytime, anywhere. With StreamVibe, you can enjoy a wide variety of content, including the latest blockbusters, classic movies, popular TV shows, and more. You can also create your own watchlists, so you can easily find the content you want to watch.',
              style: TextStyle(color: AppColors.lightGray)),
        ),
        const SizedBox(height: 40),
        CustomIconButton(
            iconData: Icons.play_arrow,
            label: AppLocalizations.of(context)!.start_watching_now,
            onTap: () {})
      ],
    );
  }
}

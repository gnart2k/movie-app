import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/constants/app_vectors.dart';
import 'package:movie_app/core/widgets/button/icon_button.dart';

class BannerWidget extends ConsumerWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: Text(
                  textAlign: TextAlign.center,
                  AppLocalizations.of(context)!.the_best_stream_experience,
                  style: const TextStyle(
                      fontSize: 42, fontWeight: FontWeight.bold),
                ),
              ),
            ])),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Text(
              textAlign: TextAlign.center,
              AppLocalizations.of(context)!.streamVibe_is_the_best_streaming,
              style: const TextStyle(color: AppColors.lightGray)),
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

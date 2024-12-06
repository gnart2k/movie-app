import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/features/movie_open_page/data/models/movie_props.dart';
import 'package:movie_app/features/movie_open_page/presentation/view_models/movie_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../constants/app_images.dart';
import '../button/icon_button.dart';

class MovieBigBanner extends ConsumerWidget {
  const MovieBigBanner({super.key, required this.onTap});

  final Function() onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MovieProps movieProps = ref.watch(movieViewModelProvider);
    if (movieProps.movieSection.buttons.isEmpty) return const SizedBox();
    MovieModel movie = MovieModel(
        name: movieProps.movieSection.title,
        imageUrl: AppImages.movieBanner,
        description: AppLocalizations.of(context)!.description);
    return Container(
      margin: const EdgeInsets.only(top: 130),
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(movie.imageUrl), fit: BoxFit.fill)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(movie.name,
                style: const TextStyle(color: Colors.white, fontSize: 38)),
            if (movie.description != null)
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: Text(
                    textAlign: TextAlign.center,
                    movie.description!,
                    style: const TextStyle(color: AppColors.lightGray)),
              ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                    label: AppLocalizations.of(context)!.play_now,
                    onTap: onTap,
                    iconData: Icons.play_arrow),
                const SizedBox(width: 12),
                ...[
                  AppIcons.plusIcon,
                  AppIcons.likeIcon,
                  AppIcons.volumeIcon
                ].map((icon) => Row(
                    children: [_iconButton(icon), const SizedBox(width: 8)])),
              ],
            ),
          ]),
    );
  }
}

Widget _iconButton(String iconUrl) {
  return GestureDetector(
      child: MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(8)),
      child: SvgPicture.asset(iconUrl),
    ),
  ));
}

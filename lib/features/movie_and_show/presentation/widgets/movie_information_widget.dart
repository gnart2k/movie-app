import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class MovieInformation extends StatelessWidget {
  MovieInformation({super.key});

  final List<String> languageList = [
    'English',
    'Hindi',
    'Tamil',
    'Telegu',
    'Kannada'
  ];

  final List<String> genresList = ['Action', 'Adventure', 'Romantic'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.only(left: 20, bottom: 164),
      width: 519,
      height: 937,
      decoration: BoxDecoration(
          color: AppColors.itemHovered,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: AppColors.cardBorder)),
      child: Column(
        children: [
          _releaseYear(context),
          _availableLanguage(context),
          _ratings(context),
          _genres(context),
          _director(context),
          _music(context)
        ],
      ),
    );
  }

  Widget _title(IconData? icon, String title) {
    return Row(
      children: [
        icon == null
            ? const SizedBox()
            : Icon(
                icon,
                color: AppColors.lightGray,
                size: 24,
              ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: GoogleFonts.manrope(
              color: AppColors.lightGray,
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _ratingItem(String title, double rate) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.itemHovered,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: AppColors.cardBorder,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: GoogleFonts.manrope(
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 1.5)),
            RatingBarIndicator(
              rating: rate,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: AppColors.primary,
              ),
              itemCount: 5,
              itemSize: 24,
              unratedColor: AppColors.lightGray,
            )
          ],
        ));
  }

  Widget _ratings(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        _title(Icons.star_border_outlined, AppLocalizations.of(context)!.ratings),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Expanded(child: _ratingItem('IMDb', 4.5)),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: _ratingItem('Streamvibe', 4))
          ],
        )
      ],
    );
  }

  Widget _genres(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Icons.grid_view_outlined, AppLocalizations.of(context)!.genres),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: genresList.map((genre) => _singleItem(genre)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _availableLanguage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Icons.translate, AppLocalizations.of(context)!.available_language),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                languageList.map((language) => _singleItem(language)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _music(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            _title(null, AppLocalizations.of(context)!.music),
            const SizedBox(
              height: 14,
            ),
            _character('B. Ajaneesh Loknath', 'From India')
          ],
        ));
  }

  Widget _director(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            _title(null, AppLocalizations.of(context)!.director),
            const SizedBox(
              height: 14,
            ),
            _character('Rishab Shetty', 'From India')
          ],
        ));
  }

  Widget _character(String name, String address) {
    return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.appBackground,
            border: Border.all(width: 1, color: AppColors.cardBorder)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset('assets/images/character.png'),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.manrope(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                ),
                Text(address,
                    style: GoogleFonts.manrope(
                        color: AppColors.lightGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5))
              ],
            ))
          ],
        ));
  }

  Widget _singleItem(String language) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.appBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: AppColors.cardBorder),
      ),
      child: Text(
        language,
        style: GoogleFonts.manrope(
          color: const Color(0xFFFFFFFF),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _releaseYear(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(Icons.calendar_today_outlined, AppLocalizations.of(context)!.release_year),
            const SizedBox(
              height: 14,
            ),
            Text('2020',
                style: GoogleFonts.manrope(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w600))
          ],
        )
      ],
    );
  }
}

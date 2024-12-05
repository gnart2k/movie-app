import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/features/home/data/models/movie_section.dart';

class MovieInformation extends StatefulWidget {
  const MovieInformation({super.key, this.movie, this.movieSection});

  final MovieSection? movieSection;

  final MovieModel? movie;

  @override
  State<MovieInformation> createState() => _MovieInformationState();
}

class _MovieInformationState extends State<MovieInformation> {
  late List<String> languageList;

  late List<String> genresList;

  @override
  Widget build(BuildContext context) {
    languageList =
        List<String>.from(widget.movieSection!.details!['availableLanguages']);

    genresList = List<String>.from(widget.movieSection!.details!['genres']);

    return Container(
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: AppColors.itemHovered,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: AppColors.cardBorder)),
      child: Column(
        children: [
          _releaseYear(),
          _availableLanguage(),
          _ratings(),
          _genres(),
          _director(),
          _music()
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
        padding: const EdgeInsets.all(10),
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

  Widget _ratings() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        _title(Icons.star_border_outlined, 'Ratings'),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Expanded(
                child: _ratingItem(
                    'IMDb',
                    widget.movieSection!.details!['ratings']?['IMDb']
                        as double)),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: _ratingItem(
                    'Streamvibe',
                    widget.movieSection!.details!['ratings']?['StreamVibe']
                        as double))
          ],
        )
      ],
    );
  }

  Widget _genres() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Icons.grid_view_outlined, 'Genres'),
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

  Widget _availableLanguage() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Icons.translate, 'Available Language'),
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

  Widget _music() {
    List<String> parts = widget.movieSection!.details!['music'].split('(');

    String name = parts[0].trim();

    String fromCountry =
        parts.length > 1 ? parts[1].replaceAll(')', '').trim() : '';
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            _title(null, 'Music'),
            const SizedBox(
              height: 14,
            ),
            _character(name, fromCountry)
          ],
        ));
  }

  Widget _director() {
    List<String> parts = widget.movieSection!.details!['director'].split('(');

    String name = parts[0].trim();

    String fromCountry =
        parts.length > 1 ? parts[1].replaceAll(')', '').trim() : '';

    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            _title(null, 'Director'),
            const SizedBox(
              height: 14,
            ),
            _character(name, fromCountry)
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

  Widget _releaseYear() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(Icons.calendar_today_outlined, 'Released Year'),
            const SizedBox(
              height: 14,
            ),
            Text(
                (widget.movieSection!.details!['releaseYear'] as int)
                    .toString(),
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

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';

import '../category/category_slider_container.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.width,
      required this.height,
      this.hour,
      this.textViewRight,
      this.isRating,
      this.releasedDate});
  final String title;
  final String imageUrl;

  final bool? isRating;

  final String? hour;
  final String? textViewRight;
  final String? releasedDate;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: isRating == true
          ? const EdgeInsets.all(20)
          : const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColors.itemHovered,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          SizedBox(
              width: width / 1.126959247648903,
              height: height / 1.237623762376238,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              releasedDate == null
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: width / 2.830708661417323 + 4,
                              height: height / 13.88888888888889,
                              decoration: BoxDecoration(
                                  color: AppColors.appBackground,
                                  borderRadius: BorderRadius.circular(51),
                                  border: Border.all(width: 1)),
                              child: _subContainerLeft())
                        ],
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [_subContainerCenter()],
                      ),
                    ),
              textViewRight == null
                  ? const SizedBox()
                  : Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: isRating == true
                                ? width / 2.445578231292517
                                : width / 4,
                            height: height / 13.88888888888889,
                            decoration: BoxDecoration(
                                color: AppColors.appBackground,
                                borderRadius: BorderRadius.circular(51),
                                border: Border.all(width: 1)),
                            child: _subContainerRight())
                      ],
                    )),
            ],
          )
        ],
      ),
    );
  }

  Widget _subContainerRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isRating == true
            ? RatingBarIndicator(
                rating: 4.5,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: AppColors.primary,
                ),
                itemCount: 5,
                itemSize: 18,
                unratedColor: AppColors.lightGray,
              )
            : const Icon(
                Icons.remove_red_eye_sharp,
                color: AppColors.lightGray,
              ),
        Text(
          textViewRight!,
          style: const TextStyle(
              height: 1.5, fontSize: 18, color: AppColors.lightGray),
        )
      ],
    );
  }

  Widget _subContainerLeft() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/vectors/time_of_movie.svg',
          height: 24.0,
          width: 24.0,
          color: AppColors.lightGray,
        ),
        hour == null
            ? const SizedBox()
            : Text(
                hour!,
                style: const TextStyle(
                    height: 1.5, fontSize: 18, color: AppColors.lightGray),
              )
      ],
    );
  }

  Widget _subContainerCenter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Released at 14 April 2023',
          style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGray),
        ),
      ],
    );
  }
}

void main() {
  runApp(const RealeasesApp());
}

class RealeasesApp extends StatelessWidget {
  const RealeasesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(210, 100, 210, 50),
          child: CategorySliderContainer(
            cardWidgetBuilder: (movie) {
              return MoviesCard(
                title: movie.name,
                imageUrl: movie.imageUrl,
                width: 290.6,
                height: 300,
                releasedDate: '14 April 2023',
              );
            },
            movieList: [
              [
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage)
              ],
              [
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage)
              ],
              [
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage),
                MovieModel(name: 'fsaf', imageUrl: AppImages.categoryImage)
              ],
            ],
            title: "New Realeases",
            subTitle: '',
            heightCard: 300,
          ),
        ),
      ),
    );
  }
}

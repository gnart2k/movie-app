import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard(
      {super.key,
      required this.title,
      this.releasedTitle,
      required this.imageUrl,
      this.hour,
      this.textViewRight,
      this.isRating});

  final String title;
  final String? releasedTitle;
  final String imageUrl;

  final bool? isRating;

  final String? hour;
  final String? textViewRight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: isRating == true
          ? const EdgeInsets.all(20)
          : const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.itemHovered,
          border: Border.all(
            color: AppColors.cardBorder,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          releasedTitle == null ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: AppColors.itemHovered,
                      border: Border.all(
                        color: AppColors.cardBorder,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: _subContainerLeft()),
              if (textViewRight == null)
                const SizedBox()
              else
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.itemHovered,
                        border: Border.all(
                          color: AppColors.cardBorder,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: _subContainerRight()),
            ],
          ) : Container(
              padding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.itemHovered,
                  border: Border.all(
                    color: AppColors.cardBorder,
                  ),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(20))),
              child: Text(releasedTitle!, textAlign: TextAlign.center,)),
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
                itemSize: 16,
                unratedColor: AppColors.lightGray,
              )
            : const Icon(
                Icons.remove_red_eye_sharp,
                color: AppColors.lightGray,
              ),
        const SizedBox(
          width: 5,
        ),
        Text(
          textViewRight!,
          style: const TextStyle(
              height: 1.5, fontSize: 14, color: AppColors.lightGray),
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
          height: 20.0,
          width: 20.0,
          // ignore: deprecated_member_use
          color: AppColors.lightGray,
        ),
        const SizedBox(
          width: 5,
        ),
        hour == null
            ? const SizedBox()
            : Text(
                hour!,
                style: const TextStyle(
                    height: 1.5, fontSize: 14, color: AppColors.lightGray),
              )
      ],
    );
  }
}

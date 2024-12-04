import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class MoviesCard extends StatefulWidget {
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
  State<MoviesCard> createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHovering = true;
      }),
      onExit: (_) => setState(() {
        isHovering = false;
      }),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        padding: widget.isRating == true
            ? const EdgeInsets.all(20)
            : const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.itemHovered,
            border: Border.all(
              color: AppColors.cardBorder,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: isHovering
                ? [
              BoxShadow(
                color: AppColors.lightGray.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ]
              : [],
        ),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            widget.releasedTitle == null ?
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
                if (widget.textViewRight == null)
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
                child: Text(widget.releasedTitle!, textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }

  Widget _subContainerRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.isRating == true
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
          widget.textViewRight!,
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
        widget.hour == null
            ? const SizedBox()
            : Text(
                widget.hour!,
                style: const TextStyle(
                    height: 1.5, fontSize: 14, color: AppColors.lightGray),
              )
      ],
    );
  }
}

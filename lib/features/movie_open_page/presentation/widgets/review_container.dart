import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/domain/model/review_model.dart';
import 'package:movie_app/core/widgets/slider/slider_button.dart';
import 'package:movie_app/core/widgets/slider/slider_indicator.dart';

class ReviewContainer extends StatefulWidget {
  final List<ReviewModel> reviewList;
  const ReviewContainer({super.key, required this.reviewList});

  @override
  State<ReviewContainer> createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer>
    with TickerProviderStateMixin {
  late CarouselSliderController? _buttonCarouselController;
  late int pageNumber;
  int currentPage = 0;

  @override
  void initState() {
    _buttonCarouselController = CarouselSliderController();
    pageNumber = widget.reviewList.length;
    super.initState();
  }

  @override
  void dispose() {
    _buttonCarouselController = null;
    super.dispose();
  }

  void _toggleGoNextSlide() {
    _buttonCarouselController?.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _toggleGoPreSlide() {
    _buttonCarouselController?.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.itemHovered,
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Review",
                style: GoogleFonts.manrope(
                  color: AppColors.lightGray,
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.cardBorder, width: 1),
                    color: AppColors.appBackground),
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4),
                    Text("Add Your Review",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselSlider.builder(
            itemCount: widget.reviewList.length,
            carouselController: _buttonCarouselController,
            itemBuilder: (context, index, realIndex) {
              return _reviewContent(context, widget.reviewList[index]);
            },
            options: CarouselOptions(
              height: 300,
              viewportFraction: 0.5,
              padEnds: false,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SliderButton(
                iconData: Icons.arrow_back,
                onTap: _toggleGoPreSlide,
                backgroundColor: AppColors.appBackground,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              Row(
                children: List.generate(
                  (widget.reviewList.length - 1).ceil(),
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SliderIndicator(isActive: currentPage == index),
                  ),
                ),
              ),
              SliderButton(
                iconData: Icons.arrow_forward,
                onTap: _toggleGoNextSlide,
                backgroundColor: AppColors.appBackground,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _reviewContent(BuildContext context, ReviewModel review) {
  return Card(
    color: AppColors.darkGray,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      width: 468.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      review.location,
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        color: AppColors.lightGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                _ratingItem(context, review),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              review.reviewText,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _ratingItem(BuildContext context, ReviewModel review) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.itemHovered,
      borderRadius: BorderRadius.circular(51),
      border: Border.all(
        width: 1,
        color: AppColors.cardBorder,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBarIndicator(
          rating: review.rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColors.primary,
          ),
          itemCount: 5,
          itemSize: 18,
          unratedColor: AppColors.lightGray,
        ),
        Text(
          review.rating.toStringAsFixed(1),
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

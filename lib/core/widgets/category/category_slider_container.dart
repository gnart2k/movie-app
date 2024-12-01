import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/widgets/category/category_card.dart';
import 'package:movie_app/core/widgets/slider/slider_controller_container.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategorySliderContainer extends StatefulWidget {
  final String title;
  final String? subTitle;

  const CategorySliderContainer(
      {super.key, required this.title, this.subTitle});

  @override
  State<StatefulWidget> createState() => _CategorySliderContainerState();
}

class _CategorySliderContainerState extends State<CategorySliderContainer>
    with TickerProviderStateMixin {
  late CarouselSliderController? _buttonCarouselController;
  final int pageNumber = 3;
  int currentPage = 0;

  @override
  void initState() {
    _buttonCarouselController = CarouselSliderController();
    super.initState();
  }

  @override
  void dispose() {
    _buttonCarouselController = null;
    super.dispose();
  }

  void _toggleGoNextSlide() {
    _buttonCarouselController?.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _toggleGoPreSlide() {
    _buttonCarouselController?.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child:
                  CommonTitle(title: widget.title, subTitle: widget.subTitle),
            ),
            const SizedBox(
              width: 30,
            ),
            SliderControllerContainer(
              pageNumber: pageNumber,
              currentPage: currentPage,
              toggleGoNext: _toggleGoNextSlide,
              toggleGoPrevious: _toggleGoPreSlide,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CarouselSlider.builder(
          carouselController: _buttonCarouselController,
          itemCount: pageNumber,
          itemBuilder: (context, index, realIndex) {
            return _CategoryContent(context);
          },
          options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: false,
              height: 290,
              scrollDirection: Axis.horizontal,
              scrollPhysics: NeverScrollableScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
        )
      ],
    );
  }
}

Widget _CategoryContent(BuildContext context) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage)
    ],
  );
}

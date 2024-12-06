import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/slider/slider_controller_container.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';

class CategorySliderContainer<T> extends StatefulWidget {
  final String title;
  final String? subTitle;
  final double? heightCard;
  final List<List<T>> list;
  final Widget Function(T item, int itemNumber) cardWidgetBuilder;

  const CategorySliderContainer({
    super.key,
    required this.list,
    required this.title,
    this.subTitle,
    this.heightCard,
    required this.cardWidgetBuilder,
  });

  @override
  State<CategorySliderContainer<T>> createState() =>
      _CategorySliderContainerState<T>();
}

class _CategorySliderContainerState<T> extends State<CategorySliderContainer<T>>
    with TickerProviderStateMixin {
  late CarouselSliderController? _buttonCarouselController;
  late int pageNumber;
  int currentPage = 0;

  @override
  void initState() {
    _buttonCarouselController = CarouselSliderController();
    pageNumber = widget.list.length;
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
            return _categoryContent(
                context, widget.list[index], widget.list[index].length);
          },
          options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: false,
              height: widget.heightCard ?? 290,
              scrollDirection: Axis.horizontal,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
        )
      ],
    );
  }

  Widget _categoryContent(BuildContext context, List<T> list, int itemNumber) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list
            .map((item) =>
                Expanded(child: widget.cardWidgetBuilder(item, itemNumber)))
            .toList(),
      ),
    );
  }
}

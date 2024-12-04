import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/model/cast_model.dart';
import 'package:movie_app/core/widgets/slider/slider_button.dart';

import '../../../../core/constants/app_colors.dart';

class CastContainer extends StatefulWidget {
  const CastContainer({super.key, required this.casts, this.heightCard});

  final List<List<CastModel>> casts;
  final double? heightCard;

  @override
  State<StatefulWidget> createState() => _CastContainerState();
}

class _CastContainerState extends State<CastContainer>
    with TickerProviderStateMixin {
  late CarouselSliderController? _buttonCarouselController;
  late int pageNumber;
  int currentPage = 0;

  @override
  void initState() {
    _buttonCarouselController = CarouselSliderController();
    pageNumber = widget.casts.length;
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
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Cast",
                style: TextStyle(color: AppColors.lightGray, fontSize: 18),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SliderButton(
                    iconData: Icons.arrow_back,
                    onTap: () {
                      _toggleGoPreSlide();
                    },
                    backgroundColor: AppColors.darkGray,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SliderButton(
                    iconData: Icons.arrow_forward,
                    onTap: () {
                      _toggleGoNextSlide();
                    },
                    backgroundColor: AppColors.darkGray,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselSlider.builder(
            carouselController: _buttonCarouselController,
            itemCount: pageNumber,
            itemBuilder: (context, index, realIndex) {
              return _castContent(
                  context, widget.casts[index], widget.casts[index].length);
            },
            options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false,
                height: widget.heightCard ?? 100,
                scrollDirection: Axis.horizontal,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index;
                  });
                }),
          )
        ],
      ),
    );
  }
}

Widget _castContent(
    BuildContext context, List<CastModel> castList, int itemNumber) {
  return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: castList.asMap().entries.map((entry) {
          int index = entry.key;
          var cast = entry.value;
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 6,
              right: index == castList.length - 1 ? 0 : 8,
            ),
            width: constraints.maxWidth / 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                cast.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  });
}

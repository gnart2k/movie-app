import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/widgets/slider/slider_button.dart';
import 'package:movie_app/core/widgets/slider/slider_indicator.dart';

class MovieSliderControllerContainer extends StatefulWidget {
  const MovieSliderControllerContainer(
      {super.key,
      required this.pageNumber,
      required this.currentPage,
      required this.toggleGoNext,
      required this.toggleGoPrevious});

  final int pageNumber;
  final int currentPage;
  final VoidCallback toggleGoNext;
  final VoidCallback toggleGoPrevious;

  @override
  State<StatefulWidget> createState() => _MovieSliderControllerContainerState();
}

class _MovieSliderControllerContainerState
    extends State<MovieSliderControllerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SliderButton(
            backgroundColor: Colors.black,
            iconData: Icons.navigate_before,
            onTap: () {
              widget.toggleGoPrevious();
            },
          ),
          Row(children: [
            const SizedBox(width: 400),
            ...List.generate(widget.pageNumber, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SliderIndicator(
                  isActive: widget.currentPage == index,
                ),
              );
            }),
            const SizedBox(width: 400),
          ]),
          SliderButton(
            backgroundColor: Colors.black,
            iconData: Icons.navigate_next,
            onTap: () {
              widget.toggleGoNext();
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'slider_button.dart';
import 'slider_indicator.dart';

class SliderControllerContainer extends StatefulWidget {
  const SliderControllerContainer(
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
  State<StatefulWidget> createState() => _SliderControllerContainerState();
}

class _SliderControllerContainerState extends State<SliderControllerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: AppColors.itemHovered,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          SliderButton(
            iconData: Icons.navigate_before,
            onTap: () {
              widget.toggleGoPrevious();
            },
          ),
          ...List.generate(widget.pageNumber, (index) {
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 5),child: SliderIndicator(
              isActive: widget.currentPage == index,
            ),);
          }),
          SliderButton(
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

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class MovieCategoryContainer extends StatelessWidget {
  const MovieCategoryContainer(
      {super.key, required this.title, this.childWidget});

  final String title;
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.itemHovered,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: childWidget,
          ),
        ),
        Positioned(
            top: -20, left: 30, child: _movieCategoryBanner(context, title)),
      ],
    );
  }
}

Widget _movieCategoryBanner(BuildContext context, String title) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
  );
}

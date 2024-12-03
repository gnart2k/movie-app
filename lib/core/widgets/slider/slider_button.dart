import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class SliderButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final Color iconColor;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;

  const SliderButton({
    super.key,
    required this.iconData,
    required this.onTap,
    this.iconColor = Colors.white,
    this.backgroundColor = AppColors.itemHovered,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.itemHovered,
              width: 2.0,
            ),
            borderRadius: borderRadius,
            color: backgroundColor),
        padding: const EdgeInsets.all(5),
        child: Icon(iconData, color: iconColor),
      ),
    );
  }
}

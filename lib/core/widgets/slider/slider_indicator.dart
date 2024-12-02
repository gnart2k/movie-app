import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class SliderIndicator extends StatelessWidget {
  final bool isActive;
  const SliderIndicator({super.key, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? 23 : 17,
      height: 4,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.itemHovered,
          borderRadius: BorderRadius.circular(100)),
      duration: const Duration(milliseconds: 200),
    );
  }
}


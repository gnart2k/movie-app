import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class SliderButton extends StatefulWidget {
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
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double _brightness = 1.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _brightness = 0.9;
        }),
        onExit: (_) => setState(() {
          _brightness = 1.0;
        }),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.itemHovered,
                width: 2.0,
              ),
              borderRadius: widget.borderRadius,
              color: widget.backgroundColor.withOpacity(_brightness)),
          padding: const EdgeInsets.all(5),
          child: Icon(widget.iconData, color: widget.iconColor),
        ),
      ),
    );
  }
}

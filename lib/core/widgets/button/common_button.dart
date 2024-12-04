import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class CommonButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;

  const CommonButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.backgroundColor = AppColors.primary});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.linear,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: widget.backgroundColor.withOpacity(isPressed ? 0.5 : 1)),
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

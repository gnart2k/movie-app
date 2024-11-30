import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;

  const CommonButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.backgroundColor = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: AppColors.primary),
        padding: const EdgeInsets.all(16.0),
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

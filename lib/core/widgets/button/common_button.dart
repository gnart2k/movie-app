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
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

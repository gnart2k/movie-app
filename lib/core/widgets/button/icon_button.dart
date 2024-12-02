import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  late String? iconUrl;
  late IconData? iconData;
  CustomIconButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.iconData,
      this.iconUrl,
      this.backgroundColor = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: AppColors.primary),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconUrl != null) SvgPicture.asset(iconUrl!),
            if (iconData != null) Icon(iconData, color: Colors.white),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

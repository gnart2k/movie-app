import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({super.key,  required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.itemHovered,
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Description", style: TextStyle(
            color: AppColors.lightGray,
            fontSize: 18
          ),),
          const SizedBox(height: 10,),
          Text(description, style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),)
        ],
      ),
    );
  }

}
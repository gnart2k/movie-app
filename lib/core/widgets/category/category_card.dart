import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      this.onTopTitle,
      this.onTop = false,
      this.itemNumber = 5});

  final String title;
  final String imageUrl;
  final String? onTopTitle;
  final bool onTop;
  final int itemNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: AppColors.itemHovered,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (onTop && onTopTitle != null) ...[
                      _onTopBanner(context, onTopTitle!),
                      const SizedBox(height: 8), // Add spacing
                    ],
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _onTopBanner(BuildContext context, String title) {
  return Container(
    padding: const EdgeInsets.all(6),
    decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 14),
    ),
  );
}

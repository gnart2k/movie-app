import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class CategoryCard extends StatefulWidget {
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
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHovering = true;
      }),
      onExit: (_) => setState(() {
        isHovering = false;
      }),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: AppColors.itemHovered,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: isHovering
              ? [
            BoxShadow(
              color: AppColors.lightGray.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]
              : [],
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                widget.imageUrl,
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
                      if (widget.onTop && widget.onTopTitle != null) ...[
                        _onTopBanner(context, widget.onTopTitle!),
                        const SizedBox(height: 8), // Add spacing
                      ],
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.white),
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

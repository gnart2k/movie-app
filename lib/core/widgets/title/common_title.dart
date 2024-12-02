import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  final String? subTitle;

  const CommonTitle({super.key, required this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        if (subTitle != null) ...[
          const SizedBox(
            height: 10,
          ),
          Text(
            subTitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.lightGray, fontSize: 18),
          )
        ]
      ],
    );
  }

}
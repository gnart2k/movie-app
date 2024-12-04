import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';

class FreeTrialWidget extends StatelessWidget {
  const FreeTrialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: 80),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage(AppImages.freeTrialBackground),
                    fit: BoxFit.fill)),
            width: double.infinity,
            padding: const EdgeInsets.all(100),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Start your free trial today!",
                            style: TextStyle(fontSize: 48)),
                        SizedBox(height: 16),
                        Text(
                            "This is a clear and concise call to action that encourages users to sign up for a free trial of StreamVibe.",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.lightGray))
                      ]),
                  CommonButton(label: "Start a Free Trial", onTap: () {})
                ])),
        const SizedBox(height: 80),
      ],
    );
  }
}

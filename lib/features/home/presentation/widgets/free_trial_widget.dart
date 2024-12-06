import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                            AppLocalizations.of(context)!
                                .start_your_free_trial_today,
                            style: const TextStyle(fontSize: 30)),
                        const SizedBox(height: 16),
                        const Text(
                            "This is a clear and concise call to action that encourages users to sign up for a free trial of StreamVibe.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, color: AppColors.lightGray))
                      ])),
                  CommonButton(
                      label: AppLocalizations.of(context)!.start_a_free_trial,
                      onTap: () {})
                ])),
        const SizedBox(height: 80),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PlanCard extends StatelessWidget {
  const PlanCard(
      {super.key,
      required this.plan,
      required this.isRegister,
      required this.onClick});

  final PlanModel plan;
  final bool isRegister;
  final Function(String) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
          color: AppColors.itemHovered,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            plan.description,
            style: const TextStyle(
              color: AppColors.lightGray,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              text: "\$${plan.price}",
              style: const TextStyle(color: Colors.white, fontSize: 25),
              children:  <TextSpan>[
                TextSpan(
                  text: '/ ${AppLocalizations.of(context)!.month}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightGray,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          if (!isRegister)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonButton(
                    label: AppLocalizations.of(context)!.start_a_free_trial,
                    onTap: () {
                      onClick(plan.title);
                    },
                    backgroundColor: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CommonButton(
                  label: AppLocalizations.of(context)!.choose_plan,
                  onTap: () {
                    onClick(plan.title);
                  },
                  backgroundColor: AppColors.appBackground,
                ))
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonButton(
                    label: AppLocalizations.of(context)!.you_have_already,
                    enabled: false,
                    onTap: () {
                      onClick(plan.title);
                    },
                    backgroundColor: AppColors.itemHovered,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

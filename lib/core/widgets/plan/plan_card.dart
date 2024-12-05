import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.plan,required this.isRegister, required this.onClick});

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
              children: const <TextSpan>[
                TextSpan(
                  text: '/month',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightGray,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          if (!isRegister) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: CommonButton(label: "Start Free Trial", onTap: () {
                onClick(plan.title);
              }, backgroundColor: AppColors.primary,),),
              const SizedBox(width: 20,),
              Expanded(child: CommonButton(label: "Choose Plan", onTap: () {
                onClick(plan.title);
              }, backgroundColor: AppColors.appBackground,))
            ],
          ) else  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: CommonButton(label: "You have already register this plan",enabled: false,onTap: () {
                onClick(plan.title);
              }, backgroundColor: AppColors.itemHovered,),),
            ],
          )
        ],
      ),
    );
  }
}

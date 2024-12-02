import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:movie_app/core/widgets/plan/plan_card.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
import '../../constants/app_colors.dart';

class PlanContainer extends StatefulWidget {
  const PlanContainer({super.key, required this.plans});

  final List<PlanModel> plans;
  @override
  State<StatefulWidget> createState() => _PlanContainerState();
}

class _PlanContainerState extends State<PlanContainer> {
  late TimeOption option;
  @override
  void initState() {
    option = TimeOption.Monthly;
    super.initState();
  }

  void _toggleTimeOption(TimeOption optionClicked) {
    setState(() {
      option = optionClicked != TimeOption.Monthly ? TimeOption.Yearly : TimeOption.Monthly;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CommonTitle(title: "Choose the plan that's right for you", subTitle: "Join StreamVibe and select from our flexible subscription options tailored to suit your viewing preferences. Get ready for non-stop entertainment!",),
            _planControllerContainer(context,option, _toggleTimeOption)
          ],
        ),
        const SizedBox(height: 40,),
        Row(
          children: [
            for (int i = 0; i < widget.plans.length; i++) ...[
              Expanded(child: PlanCard(plan: widget.plans[i])),
              if (i < widget.plans.length - 1)
                const SizedBox(width: 15),
            ],
          ],
        )
      ],
    );
  }
  
}

Widget _planControllerContainer(BuildContext context , TimeOption option, void Function(TimeOption) onTap) {
  return Container(
    padding: const EdgeInsets.all(10),

    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.itemHovered,
        width: 2.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.black,
    ),
    child: Row(
      children: [
        CommonButton(label: "Monthly", onTap: () {
          onTap(TimeOption.Monthly);
        }, backgroundColor: option == TimeOption.Monthly ? AppColors.appBackground : Colors.black,),
        CommonButton(label: "Yearly", onTap: () {
          onTap(TimeOption.Yearly);
        }, backgroundColor: option == TimeOption.Yearly ? AppColors.appBackground : Colors.black)
      ],
    ),
  );
}
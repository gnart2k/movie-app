import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:movie_app/core/widgets/plan/plan_card.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
import '../../../features/subscription_page/presentation/view_models/plan_viewmodel.dart';
import '../../constants/app_colors.dart';
import '../dialog/custom_dialog.dart';

class PlanContainer extends ConsumerStatefulWidget {
  const PlanContainer({super.key, required this.plans});

  final List<PlanModel> plans;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlanContainerState();
}

class _PlanContainerState extends ConsumerState<PlanContainer> {
  late TimeOption option;

  @override
  void initState() {
    option = TimeOption.monthly;
    super.initState();
  }

  void _toggleTimeOption(TimeOption optionClicked) {
    setState(() {
      option = optionClicked != TimeOption.monthly
          ? TimeOption.yearly
          : TimeOption.monthly;
    });
  }

  @override
  Widget build(BuildContext context) {
    final planViewModel = ref.watch(planProvider);
    final plan = ref.read(planProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
                child: CommonTitle(
              title: "Choose the plan that's right for you",
              subTitle:
                  "Join StreamVibe and select from our flexible subscription options tailored to suit your viewing preferences. Get ready for non-stop entertainment!",
            )),
            const SizedBox(
              width: 20,
            ),
            _planControllerContainer(context, option, _toggleTimeOption)
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            for (int i = 0; i < widget.plans.length; i++) ...[
              Expanded(
                  child: PlanCard(
                plan: widget.plans[i],
                isRegister: plan == widget.plans[i].title,
                onClick: (String plan) {
                    if(ref.read(planProvider).isEmpty) {
                      ref.read(planProvider.notifier).addPLan(plan);
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          title: 'Congratulation' ,
                          message: 'You just register the $plan ',
                          isSuccess: true,
                          onOkPressed: () {
                            Navigator.of(context).pop();
                          },
                          onCancelPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          title: 'Notification' ,
                          message: 'You have to delete the current plan before add new',
                          isSuccess: false,
                          onOkPressed: () {
                            ref.read(planProvider.notifier).deleteCurrentPlan();
                            Navigator.of(context).pop();
                          },
                          onCancelPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    }
                },
              )),
              if (i < widget.plans.length - 1) const SizedBox(width: 15),
            ],
          ],
        )
      ],
    );
  }
}

Widget _planControllerContainer(
    BuildContext context, TimeOption option, void Function(TimeOption) onTap) {
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
        CommonButton(
          label: "Monthly",
          onTap: () {
            onTap(TimeOption.monthly);
          },
          backgroundColor: option == TimeOption.monthly
              ? AppColors.appBackground
              : Colors.black,
        ),
        CommonButton(
            label: "Yearly",
            onTap: () {
              onTap(TimeOption.yearly);
            },
            backgroundColor: option == TimeOption.yearly
                ? AppColors.appBackground
                : Colors.black)
      ],
    ),
  );
}

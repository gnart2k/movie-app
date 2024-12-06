import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:movie_app/core/widgets/plan/plan_card.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../features/subscription_page/presentation/view_models/plan_viewmodel.dart';
import '../../constants/app_colors.dart';
import '../dialog/custom_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final plan = ref.read(planProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CommonTitle(
              title: AppLocalizations.of(context)!
                  .choose_right_plan,
              subTitle:  AppLocalizations.of(context)!
                  .join_stream_vibe,
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
                  if (ref.read(planProvider).isEmpty) {
                    ref.read(planProvider.notifier).addPLan(plan);
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: AppLocalizations.of(context)!.congrat,
                        message: '${AppLocalizations.of(context)!.you_register} $plan ',
                        isSuccess: true,
                        onOkPressed: () {
                          Navigator.of(context).pop();
                        },
                        onCancelPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: AppLocalizations.of(context)!.notification,
                        message:
                        AppLocalizations.of(context)!.you_have,
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
          label:  AppLocalizations.of(context)!
              .monthly,
          onTap: () {
            onTap(TimeOption.monthly);
          },
          backgroundColor: option == TimeOption.monthly
              ? AppColors.appBackground
              : Colors.black,
        ),
        CommonButton(
            label:  AppLocalizations.of(context)!
                .yearly,
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

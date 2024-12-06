import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
import 'package:movie_app/features/home/data/models/compare_plans.dart';
import 'package:movie_app/features/home/presentation/view_models/compare_plans_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ComparePlansWidget extends ConsumerStatefulWidget {
  const   ComparePlansWidget({super.key});

  @override
  ComparePlansState createState() => ComparePlansState();
}

class ComparePlansState extends ConsumerState<ComparePlansWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(comparePlansViewModelProvider.notifier).getComparePlans();
  }

  final String subTitle =
      'StreamVibe offers three different plans to fit your needs: Basic, Standard, and Premium. Compare the features of each plan and choose the one that\'s right for you.';

  final List<String> columnTitleList = [
    "Feature",
    "Basic Plan",
    "Standard Plan",
    "Premium Plan"
  ];

  @override
  Widget build(BuildContext context) {


    final state = ref.watch(comparePlansViewModelProvider);

    if (state.rows.isEmpty) return const SizedBox.shrink();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTitle(title: AppLocalizations.of(context)!.compare_plane, subTitle: AppLocalizations.of(context)!.stream_vibe_offer),
        const SizedBox(height: 80),
        Table(
          border: TableBorder.all(
              width: 0.1, color: AppColors.topBarText), // Viền của bảng
          children: [
            _titleRow(state.columns),
            for (var map in state.rows) _contentRow(map),
          ],
        )
      ],
    );
  }

  TableRow _contentRow(CompareRow item) {
    return TableRow(
      decoration: const BoxDecoration(color: AppColors.appBackground),
      children: [
        _singleItemContentRow(item.feature),
        _singleItemContentRow(item.basic),
        _singleItemContentRow(item.standard),
        _singleItemContentRow(item.premium),
      ],
    );
  }

  Widget _singleItemContentRow(String item) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Text(
        item,
        style: GoogleFonts.manrope(
            color: AppColors.lightGray, fontWeight: FontWeight.w500),
      ),
    );
  }

  TableRow _titleRow(List<String> state) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 1, color: AppColors.cardBorder),
        ),
      ),
      children: [
        for (var item in state) _singleItemTitleRow(item),
      ],
    );
  }

  Widget _singleItemTitleRow(String item) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Text(
            item,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              height: 1.5,
            ),
          ),
          item == "Standard Plan"
              ? Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    'Popular',
                    style: GoogleFonts.manrope(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

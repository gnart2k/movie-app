import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
import 'package:movie_app/core/constants/app_vectors.dart';
import 'package:movie_app/core/widgets/search/search_text_field.dart';
import 'package:movie_app/features/home/presentation/view_models/header_view_model.dart';

import '../../features/app/presentation/widgets/locale_switcher_widget.dart';
import '../../features/app/presentation/widgets/show_history_widget.dart';

class HeaderWidgets extends ConsumerStatefulWidget {
  const HeaderWidgets({super.key, required this.isChangeColor});
  final bool isChangeColor;
  @override
  ConsumerState<HeaderWidgets> createState() => _HeaderWidgetsState();
}

class _HeaderWidgetsState extends ConsumerState<HeaderWidgets> {
  late List<NavBarProps> navbarItems;

  List<NavBarProps> getNavbarItems(List<NavigationLinkModel> navBarData) {
    if (navBarData.where((item) => item.isSelected).toList().isEmpty) {
      return navBarData
          .asMap()
          .map((index, e) => MapEntry(
                index,
                index == 0
                    ? NavBarProps(label: e.url, isSelected: true)
                    : NavBarProps(label: e.url, isSelected: e.isSelected),
              ))
          .values
          .toList();
    } else {
      return navBarData
          .asMap()
          .map((index, e) => MapEntry(
                index,
                NavBarProps(label: e.url, isSelected: e.isSelected),
              ))
          .values
          .toList();
    }
  }

  @override
  void initState() {
    ref.read(headerViewModelProvider.notifier).getHeaderInfo();
    super.initState();
    List<NavigationLinkModel> navBarData =
        ref.read(headerViewModelProvider).navigationLinks;
    navbarItems = getNavbarItems(navBarData);
  }

  void _onNavBarItemTap(int index, WidgetRef ref) {
    ref.read(headerViewModelProvider.notifier).toggleNavbar(index);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500, ),
      color: widget.isChangeColor ? Colors.black :  Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 100),
      child: Row(children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(AppVectors.logo)],
        )),
        _buildNavBar(context),
        Expanded(child: _iconContainer(context)),
      ]),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Consumer(builder: (context, viewModel, child) {
      final navbarItemList =
          viewModel.watch(headerViewModelProvider).navigationLinks;
      final items = getNavbarItems(navbarItemList);
      if (items.isEmpty) return SizedBox();
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.topBarBorder, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: items.map((item) {
            final isSelected = item.isSelected;
            return GestureDetector(
              onTap: () => {
                context.go("/${item.label.replaceAll(" & ", "").trim()}"),
                _onNavBarItemTap(items.indexOf(item), viewModel)
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: isSelected
                      ? BoxDecoration(
                          color: AppColors.itemHovered,
                          borderRadius: BorderRadius.circular(8),
                        )
                      : null,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.topBarText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }

  Widget _iconContainer(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      const SearchTextField(),
      const SizedBox(width: 16),
      ShowHistory(),
      const SizedBox(width: 16),
      const LocaleSwitcherWidget(),
    ]);
  }

  Widget _navBarList(BuildContext context, List<NavBarProps> itemLists) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.topBarBorder, width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
          children: itemLists
              .map((item) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                        decoration: item.isSelected
                            ? BoxDecoration(
                                color: AppColors.itemHovered,
                                borderRadius: BorderRadius.circular(8))
                            : null,
                        padding: const EdgeInsets.all(10),
                        child: Text(item.label,
                            style: TextStyle(
                                color: item.isSelected
                                    ? Colors.white
                                    : AppColors.topBarText))),
                  ))
              .toList()),
    );
  }
}

class NavBarProps {
  final String label;
  final bool isSelected;

  NavBarProps({required this.label, this.isSelected = false});

  NavBarProps copyWith({String? label, bool? isSelected}) {
    return NavBarProps(
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

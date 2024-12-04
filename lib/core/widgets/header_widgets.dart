import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
import 'package:movie_app/core/constants/app_vectors.dart';
import 'package:movie_app/core/widgets/search/search_text_field.dart';
import 'package:movie_app/features/home/presentation/view_models/header_view_model.dart';

class HeaderWidgets extends ConsumerStatefulWidget {
  const HeaderWidgets({super.key});

  @override
  ConsumerState<HeaderWidgets> createState() => _HeaderWidgetsState();
}

class _HeaderWidgetsState extends ConsumerState<HeaderWidgets> {
  late List<NavBarProps> navbarItems;

  @override
  void initState() {
    ref.read(headerViewModelProvider.notifier).getHeaderInfo();
    super.initState();
    List<String> navBarData = ref.read(headerViewModelProvider).navigationLinks;
    print(navBarData);
    navbarItems = navBarData.map((e) => NavBarProps(label: e)).toList();
    // [
    //   NavBarProps(label: 'Home', isSelected: true),
    //   NavBarProps(label: 'Movie & Show'),
    //   NavBarProps(label: 'Support'),
    //   NavBarProps(label: 'Subscriptions'),
    // ];
  }

  void _onNavBarItemTap(int index) {
    setState(() {
      for (var i = 0; i < navbarItems.length; i++) {
        navbarItems[i] = navbarItems[i].copyWith(isSelected: i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 100),
      child: Row(children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(AppVectors.logo)],
        )),
        _navBarList(context, navbarItems),
        Expanded(child: _iconContainer(context)),
      ]),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.topBarBorder, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: navbarItems.map((item) {
          final isSelected = item.isSelected;
          return GestureDetector(
            onTap: () => _onNavBarItemTap(navbarItems.indexOf(item)),
            child: Container(
              decoration: isSelected
                  ? BoxDecoration(
                      color: AppColors.itemHovered,
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                item.label,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.topBarText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _iconContainer(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      SearchTextField(),
      const SizedBox(width: 16),
      GestureDetector(child: SvgPicture.asset(AppIcons.bellIcon, width: 26))
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
              .map((item) => Container(
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
                              : AppColors.topBarText))))
              .toList()),
    );
  }

  Widget _buildIconContainer() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // Add your search action here
          },
          child: SvgPicture.asset(AppIcons.searchIcon, width: 26),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            print(ref.read(headerViewModelProvider).navigationLinks.toString());
            // Add your notifications action here
          },
          child: SvgPicture.asset(AppIcons.bellIcon, width: 26),
        ),
      ],
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

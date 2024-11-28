import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
import 'package:movie_app/core/constants/app_vectors.dart';

class HeaderWidgets extends StatefulWidget {
  const HeaderWidgets({super.key});

  @override
  State<HeaderWidgets> createState() => _HeaderWidgetsState();
}

class _HeaderWidgetsState extends State<HeaderWidgets> {
  late List<NavBarProps> navbarLabel;
  @override
  void initState() {
    super.initState();
    navbarLabel = [
      NavBarProps(label: 'Home', isSelected: true),
      NavBarProps(label: 'Movie & Show'),
      NavBarProps(label: 'Support'),
      NavBarProps(label: 'Subscriptions')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SvgPicture.asset(AppVectors.logo),
        _navBarList(context, navbarLabel),
        _iconContainer(context),
      ]),
    );
  }
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

Widget _iconContainer(BuildContext context) {
  return Row(children: [
    GestureDetector(child: SvgPicture.asset(AppIcons.searchIcon, width: 26)),
    const SizedBox(width: 16),
    GestureDetector(child: SvgPicture.asset(AppIcons.bellIcon, width: 26))
  ]);
}

class NavBarProps {
  final String label;
  final bool isSelected;
  NavBarProps({required this.label, this.isSelected = false});
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: const BoxDecoration(color: AppColors.darkGray),
      child: Column(
        children: [_listOptions(), _licenseOption()],
      ),
    );
  }
}

class IconProps {
  final String icon;
  final String url;

  IconProps({required this.icon, required this.url});
}

Widget _listOptions() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
        flex: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Home', ['Categories', 'Devices', 'Pricing', 'FAQ']),
            _buildSection(
                'Movies', ['Genres', 'Trending', 'New Release', 'Popular']),
            _buildSection(
                'Shows', ['Genres', 'Trending', 'New Release', 'Popular']),
            _buildSection('Support', ['Contact Us']),
            _buildSection('Subscription', ['Plans', 'Features']),
          ],
        ),
      ),
      Flexible(
        flex: 2,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Connect with us"),
              const SizedBox(height: 10),
              _iconContainer([
                IconProps(url: "fb.com", icon: AppIcons.facebookIcon),
                IconProps(url: "x.com", icon: AppIcons.twitterIcon),
                IconProps(url: "linkedin.com", icon: AppIcons.linkedInIcon)
              ]),
            ]),
      )
    ],
  );
}

Widget _buildSection(String title, List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      ...items.map(
        (item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            item,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ),
    ],
  );
}

Widget _licenseOption() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(180.0, 80, 100, 20),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text('@2023 streamvib, All Rights Reserved',
          style: TextStyle(color: AppColors.lightGray)),
      Row(
          children: ['Terms of Use', 'Privacy Policy', 'Cookie Policy']
              .map((item) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(item,
                        style: const TextStyle(color: AppColors.lightGray)),
                  ))
              .toList())
    ]),
  );
}

Widget _iconContainer(List<IconProps> icons) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: icons
          .map((e) => GestureDetector(
              onTap: () {
                launchUrl(Uri(path: e.url));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.itemHovered,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(e.icon),
              )))
          .toList());
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';

class MultiPlatformWidget extends StatelessWidget {
  const MultiPlatformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> platforms = [
      {'icon': AppIcons.smartPhoneIcon, 'title': 'Smartphones'},
      {'icon': AppIcons.tabletIcon, 'title': 'Laptops'},
      {'icon': AppIcons.smartTvIcon, 'title': 'Smart TV'},
      {'icon': AppIcons.laptopIcon, 'title': 'Tablet'},
      {'icon': AppIcons.gamingConsoleIcon, 'title': 'Gaming Consoles'},
      {'icon': AppIcons.vrHeadsetIcon, 'title': 'VR Headsets'},
    ];

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We Provide you streaming experience across various devices.',
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'With StreamVibe, you can enjoy your favorite movies and TV shows anytime, anywhere. Our platform is designed to be compatible with a wide range of devices, ensuring that you never miss a moment of entertainment.',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGray),
            ),
            SizedBox(height: 80),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1.75,
              ),
              itemCount: platforms.length,
              itemBuilder: (context, index) {
                final platform = platforms[index];
                return Container(
                  decoration: BoxDecoration(),
                  child: Card(
                    color: AppColors.darkGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xfE50000),
                              Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppColors.cardBorder, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.appBackground,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: AppColors.topBarBorder,
                                            width: 1)),
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: SvgPicture.asset(
                                        platform['icon']!,
                                      ),
                                    )),
                                const SizedBox(width: 16),
                                Text(
                                  platform['title']!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

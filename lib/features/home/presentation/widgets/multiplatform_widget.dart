import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
import 'package:movie_app/features/home/presentation/view_models/home_view_model.dart';

class MultiPlatformWidget extends ConsumerWidget {
  const MultiPlatformWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProps = ref.watch(homeViewModelProvider);
    final devices = homeProps.deviceCompatibilitiy.devices;
    if (homeProps.deviceCompatibilitiy.devices.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final List<String> deviceIcons = [
      AppIcons.smartPhoneIcon,
      AppIcons.tabletIcon,
      AppIcons.smartTvIcon,
      AppIcons.laptopIcon,
      AppIcons.gamingConsoleIcon,
      AppIcons.vrHeadsetIcon,
    ];

    final List<Map<String, String>> platforms = List.generate(
      devices.length,
      (index) => {'icon': deviceIcons[index], 'title': devices[index]},
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTitle(title: homeProps.deviceCompatibilitiy.title,subTitle:'With StreamVibe, you can enjoy your favorite movies and TV shows anytime, anywhere. Our platform is designed to be compatible with a wide range of devices, ensuring that you never miss a moment of entertainment.',),
        const SizedBox(height: 30),
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
              decoration: const BoxDecoration(),
              child: Card(
                color: AppColors.darkGray,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.linearGardientColor,
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.cardBorder, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
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
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: SvgPicture.asset(
                                  platform['icon']!,
                                  width: 30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              platform['title']!,
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGray,
                          ),
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
    );
  }
}

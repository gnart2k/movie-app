import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            homeProps.deviceCompatibilitiy.title,
            style: GoogleFonts.manrope(
              fontSize: 38,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            AppLocalizations.of(context)!.description_streamvibe,
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGray,
            ),
          ),
          const SizedBox(height: 80),
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
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: SvgPicture.asset(
                                    platform['icon']!,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                platform['title']!,
                                style: GoogleFonts.manrope(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            AppLocalizations.of(context)!.app_description,
                            style: GoogleFonts.manrope(
                              fontSize: 18,
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
      ),
    );
  }
}

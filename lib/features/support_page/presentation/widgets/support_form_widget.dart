import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/features/support_page/presentation/view_models/support_form_view_model.dart';

class SupportFormWidget extends ConsumerStatefulWidget {
  const SupportFormWidget({super.key});

  @override
  ConsumerState<SupportFormWidget> createState() => _SupportFormWidgetState();
}

class _SupportFormWidgetState extends ConsumerState<SupportFormWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(supportFormViewModelProvider.notifier).fetchSupportForm();
  }

  @override
  Widget build(BuildContext context) {
    final supportForm = ref.watch(supportFormViewModelProvider);
    if (supportForm.welcomeMessage.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .welcome,
                  style: GoogleFonts.manrope(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  AppLocalizations.of(context)!
                      .we_re_here,
                  style: GoogleFonts.manrope(
                      fontSize: 18,
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 533,
                  height: 477,
                  child: Image.asset(AppImages.supportPageMovieImage),
                ),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Flexible(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.cardBorder, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: _buildLabelledTextField(
                                label: AppLocalizations.of(context)!
                                    .first_name,
                                placeHolder:
                                AppLocalizations.of(context)!
                                    .enter_first_name)),
                        const SizedBox(width: 50),
                        Expanded(
                            child: _buildLabelledTextField(
                                label: AppLocalizations.of(context)!
                                    .last_name,
                                placeHolder:
                                AppLocalizations.of(context)!
                                    .enter_last_name)),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                            child: _buildLabelledTextField(
                                label: AppLocalizations.of(context)!
                                    .email,
                                placeHolder:
                                AppLocalizations.of(context)!
                                    .enter_email)),
                        const SizedBox(width: 50),
                        Expanded(
                          child: _buildPhoneNumberField(
                              label: AppLocalizations.of(context)!
                                  .phone_number,
                              placeHolder:
                              AppLocalizations.of(context)!
                                  .enter_phone_number,
                              countryCode:
                                  supportForm.form.fields[3].countryCode),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    _buildLabelledTextField(
                        label: AppLocalizations.of(context)!
                            .message,
                        maxLines: 6,
                        placeHolder: AppLocalizations.of(context)!
                            .enter_your_message),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Transform.scale(
                            scale: 1.7,
                            child: Checkbox(
                              value: false,
                              onChanged: (value) {},
                              activeColor: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!
                                .i_agree,
                            style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightGray),
                          ),
                        ),
                        const SizedBox(height: 70),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 176,
                              height: 63,
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(6)),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .send_message,
                                  style: GoogleFonts.manrope(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildLabelledTextField(
      {required String label, required String placeHolder, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        TextField(
          maxLines: maxLines,
          style: GoogleFonts.manrope(
            color: AppColors.signInText,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: placeHolder,
            labelStyle: GoogleFonts.manrope(
              color: AppColors.lightGray,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: const EdgeInsets.all(20),
            filled: true,
            fillColor: AppColors.appBackground,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColors.cardBorder, width: 1)),
          ),
        ),
      ],
    );
  }
}

Widget _buildPhoneNumberField(
    {required String label,
    required String placeHolder,
    required countryCode}) {
  String selectedValue = countryCode;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.appBackground,
              border: Border.all(color: AppColors.cardBorder, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              value: selectedValue,
              items: [
                DropdownMenuItem(
                    value: countryCode,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        AppImages.flagsImage,
                      ),
                    )),
              ],
              onChanged: (value) {},
              isExpanded: false,
              underline: const SizedBox(),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              style: GoogleFonts.manrope(
                color: AppColors.signInText,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: placeHolder,
                labelStyle: GoogleFonts.manrope(
                  color: AppColors.lightGray,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.all(20),
                filled: true,
                fillColor: AppColors.appBackground,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: AppColors.cardBorder, width: 1)),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

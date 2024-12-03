import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_images.dart';

class SupportFormWidget extends StatelessWidget {
  const SupportFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to our\nsupport page!',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  "We're here to help you with any problems you may be having with our product.",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 50),
                Container(
                  width: 533,
                  height: 477,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.darkGray,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(width: 6, color: AppColors.cardBorder)),
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.moonlightMovieImage),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Container(
            width: 976,
            height: 739,
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
                            label: 'First Name',
                            inLineLabel: 'Enter First Name')),
                    const SizedBox(width: 50),
                    Expanded(
                        child: _buildLabelledTextField(
                            label: 'Last Name',
                            inLineLabel: 'Enter Last Name')),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                        child: _buildLabelledTextField(
                            label: 'Email', inLineLabel: 'Enter your Email')),
                    const SizedBox(width: 50),
                    Expanded(
                      child: _buildPhoneNumberField(),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                _buildLabelledTextField(
                    label: 'Message',
                    maxLines: 6,
                    inLineLabel: 'Enter Your Message'),
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
                    const Expanded(
                      child: Text(
                        'I agree with Terms of Use and Privacy Policy',
                        style: TextStyle(
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
                              color: const Color(0xFFE50000),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Send Message',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  height: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelledTextField(
      {required String label, required String inLineLabel, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: inLineLabel,
            labelStyle: const TextStyle(
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

Widget _buildPhoneNumberField() {
  String selectedValue = '+1';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Phone Number',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                    value: '+1',
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
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Enter Phone Number',
                labelStyle: const TextStyle(
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

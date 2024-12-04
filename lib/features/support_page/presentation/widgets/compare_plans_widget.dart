import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';

class ComparePlans extends StatelessWidget {
  ComparePlans({super.key});

  final String title = 'Compare our plans and find the right one for you';
  final String subTitle =
      'StreamVibe offers three different plans to fit your needs: Basic, Standard, and Premium. Compare the features of each plan and choose the one that\'s right for you.';

  final List<String> columnTitleList = [
    "Feature",
    "Basic Plan",
    "Standard Plan",
    "Premium Plan"
  ];
  final List<Map<String, String>> rowContentList = [
    {
      "feature": "Price",
      "basic": "\$9.99/month",
      "standard": "\$12.99/month",
      "premium": "\$14.99/month"
    },
    {
      "feature": "Content Access",
      "basic": "All content",
      "standard": "All content",
      "premium": "All content"
    },
    {
      "feature": "Device Usage",
      "basic": "1 device",
      "standard": "2 devices",
      "premium": "4 devices"
    },
    {
      "feature": "Free Trial Duration",
      "basic": "7 days",
      "standard": "7 days",
      "premium": "7 days"
    },
    {
      "feature": "Cancellation Policy",
      "basic": "Anytime",
      "standard": "Anytime",
      "premium": "Anytime"
    },
    {
      "feature": "HDR Support",
      "basic": "No",
      "standard": "Yes",
      "premium": "Yes"
    },
    {
      "feature": "Dolby Atmos Support",
      "basic": "No",
      "standard": "Yes",
      "premium": "Yes"
    },
    {
      "feature": "Ad-Free Experience",
      "basic": "No",
      "standard": "Yes",
      "premium": "Yes"
    },
    {
      "feature": "Offline Viewing",
      "basic": "No",
      "standard": "Yes",
      "premium": "Yes"
    },
    {
      "feature": "Family Sharing",
      "basic": "No",
      "standard": "No",
      "premium": "Yes"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTitle(title: title, subTitle: subTitle),
        const SizedBox(
          height: 80,
        ),
        Table(
          border: TableBorder.all(
              width: 0.1, color: AppColors.topBarText), // Viền của bảng
          children: [
            _titleRow(),
            for (var map in rowContentList) _contentRow(map)
          ],
        )
      ],
    );
  }

  TableRow _contentRow(Map<String, String> map) {
    return TableRow(
        decoration: const BoxDecoration(color: AppColors.appBackground),
        children: [
          _singleItemContentRow(map['feature'] ?? 'Null'),
          _singleItemContentRow(map['basic'] ?? 'Null'),
          _singleItemContentRow(map['standard'] ?? 'Null'),
          _singleItemContentRow(map['premium'] ?? 'Null'),
        ]);
  }

  Widget _singleItemContentRow(String item) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Text(
          item,
          style: const TextStyle(
              color: AppColors.lightGray, fontWeight: FontWeight.w500),
        ));
  }

  TableRow _titleRow() {
    return TableRow(
        decoration: const BoxDecoration(
            border: Border(
          left: BorderSide(width: 1, color: AppColors.cardBorder),
        )),
        children: [
          for (var item in columnTitleList) _singleItemTitleRow(item)
        ]);
  }

  Widget _singleItemTitleRow(String item) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Row(children: [
          Text(item,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                height: 1.5,
              )),
          item == "Standard Plan"
              ? Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2)),
                  child: const Text('Popular'),
                )
              : const SizedBox()
        ]));
  }
}

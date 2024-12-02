import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_dropdown.dart';

const List<String> languageList = <String>['English', 'Tiếng Việt', '한국어'];

class LanguageSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDropdown(list: languageList);
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:movie_app/core/widgets/button/icon_button.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderWidgets(),
        CommonButton(label: "fsa", onTap: () {}),
        CustomIconButton(
            label: 'cvasfdsa', onTap: () {}, iconData: Icons.play_arrow),
        FooterWidget(),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/question_list_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const HeaderWidgets(),
        SizedBox(
            child: Column(
          children: [const FreeTrialWidget(), QuestionListUi()],
        )),
        const FooterWidget(),
      ],
    )));
  }
}

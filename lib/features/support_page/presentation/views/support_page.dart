import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';
import 'package:movie_app/features/support_page/presentation/widgets/support_form_widget.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  const SupportFormWidget(),
                  const SizedBox(height: 150),
                  FrequentlyAskedQuestionsWidget(),
                  const FreeTrialWidget(),
                ],
              ),
            ),
            const FooterWidget(),
          ])),
          const HeaderWidgets(),
        ],
      ),
    );
  }
}

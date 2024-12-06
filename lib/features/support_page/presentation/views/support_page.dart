import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';
import 'package:movie_app/features/support_page/presentation/widgets/support_form_widget.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: const Column(
          children: [
            SizedBox(height: 180),
            SupportFormWidget(),
            SizedBox(height: 150),
            FrequentlyAskedQuestionsWidget(),
            SizedBox(height: 150),
            FreeTrialWidget(),
          ],
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_images.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/category/category_card.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';
import 'package:movie_app/features/support_page/presentation/widgets/support_form_widget.dart';
import '../../../../core/widgets/category/category_slider_container.dart';

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
              child: const Column(
                children: [
                  SizedBox(height: 180),
                  SupportFormWidget(),
                  SizedBox(height: 150),
                  FrequentlyAskedQuestionsWidget(),
                  FreeTrialWidget(),
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

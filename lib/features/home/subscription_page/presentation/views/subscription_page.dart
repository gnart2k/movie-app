import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/model/plan_model.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';
import 'package:movie_app/core/widgets/plan/plan_container.dart';
import 'package:movie_app/features/home/presentation/widgets/free_trial_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/frequently_asked_question_widget.dart';
import 'package:movie_app/features/support_page/presentation/widgets/compare_plans_widget.dart';
import 'package:movie_app/features/support_page/presentation/widgets/support_form_widget.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});
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
                  const SizedBox(height: 180),
                  PlanContainer(
                    plans: [
                      PlanModel(
                          title: 'Basic Plan',
                          description:
                              'Enjoy an extensive library of movies and shows, featuring a range of content, including recently released titles.',
                          price: 9.99),
                      PlanModel(
                          title: 'Standard Plan',
                          description:
                              'Access to a wider selection of movies and shows, including most new releases and exclusive content',
                          price: 12.99),
                      PlanModel(
                          title: 'Premium Plan',
                          description:
                              'Access to a widest selection of movies and shows, including all new releases and Offline Viewing',
                          price: 14.99),
                    ],
                  ),
                  const SizedBox(height: 150),
                  ComparePlans(),
                  const SizedBox(height: 150),
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
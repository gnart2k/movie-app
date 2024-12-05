import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
import 'package:movie_app/features/home/data/models/faq_section.dart';
import 'package:movie_app/features/home/presentation/view_models/faq_section_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FrequentlyAskedQuestionsWidget extends ConsumerStatefulWidget {
  const FrequentlyAskedQuestionsWidget({super.key});

  @override
  FrequentlyAskedQuestionsWidgetState createState() =>
      FrequentlyAskedQuestionsWidgetState();
}

class FrequentlyAskedQuestionsWidgetState
    extends ConsumerState<FrequentlyAskedQuestionsWidget> {
  @override
  void initState() {
    super.initState();

    ref.read(faqSectionViewModelProvider.notifier).getFaqSection();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(faqSectionViewModelProvider);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _questionTitle(context, state.title),
          const SizedBox(height: 20,),
          _questionBody(context, state.questions),
        ],
      ),
    );
  }

  Widget _questionBody(BuildContext context, List<Question> questions) {
    final length = questions.length;
    final firstHalf = questions.take(length - length ~/ 2).toList();
    final secondHalf = questions.skip(length - length ~/ 2).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: firstHalf.length,
            itemBuilder: (context, index) {
              final item = firstHalf[index];
              return QuestionItem(item: item, index: index + 1);
            },
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: secondHalf.length,
            itemBuilder: (context, index) {
              final item = secondHalf[index];
              return QuestionItem(
                item: item,
                index: index + firstHalf.length + 1,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _questionTitle(BuildContext context, String title) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: CommonTitle(
              title: title,
              subTitle:
                  AppLocalizations.of(context)!.got_questions,
            ),
          ),
          CommonButton(label: AppLocalizations.of(context)!.ask_a_question, onTap: () {}),
        ],
      ),
    );
  }
}

class QuestionItem extends ConsumerStatefulWidget {
  const QuestionItem({super.key, required this.item, required this.index});

  final Question item;

  final int index;

  @override
  ConsumerState<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends ConsumerState<QuestionItem> {
  late final String question;
  late final String answer;

  String currentText = '';

  void showText() {
    setState(() {
      currentText == '' ? currentText = answer : currentText = '';
    });
  }

  @override
  void initState() {
    super.initState();
    question = widget.item.question;
    answer = widget.item.answer;
  }

  @override
  Widget build(BuildContext context) {
    widget.item;
    return Row(
      children: [
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Color.fromARGB(171, 244, 67, 54),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: currentText == ''
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 62,
                height: 67,
                decoration: BoxDecoration(
                    color: const Color(0xFF1F1F1F),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 1, color: const Color(0xFF262626))),
                child: Text(
                  '0${widget.index}',
                  style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        fontSize: 22),
                  ),
                  currentText == ''
                      ? const SizedBox()
                      : const SizedBox(
                          height: 14,
                        ),
                  currentText == ''
                      ? const SizedBox()
                      : Text(
                          currentText,
                          style: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 18,
                              height: 1.5),
                        )
                ],
              )),
              const SizedBox(
                width: 16,
              ),
              IconButton(
                iconSize: 30,
                onPressed: () {
                  showText();
                },
                icon: currentText == ''
                    ? const Icon(Icons.add)
                    : const Icon(Icons.remove),
              )
            ],
          ),
        ))
      ],
    );
  }
}

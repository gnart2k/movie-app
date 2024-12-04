import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/widgets/button/common_button.dart';
import 'package:movie_app/core/widgets/title/common_title.dart';
<<<<<<< HEAD
import 'package:movie_app/features/home/data/models/faq_section.dart';
import 'package:movie_app/features/home/presentation/view_models/faq_section_viewmodel.dart';

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
=======

class FrequentlyAskedQuestionsWidget extends StatelessWidget {
  FrequentlyAskedQuestionsWidget({super.key});

  final List<Map<String, String>> _bodyList = [
    {
      'What is StreamVibe?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
    {
      'How much does StreamVibe cost?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
    {
      'What content is available on StreamVibe?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
    {
      'How can I watch StreamVibe?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
    {
      'How do I sign up for StreamVibe?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
    {
      'What is the StreamVibe free trial?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
    {
      'How do I contact StreamVibe customer support?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
    {
      'What are the StreamVibe payment methods?':
          'StreamVibe is a streaming service that allows you to watch movies and shows on demand.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [_questionTitle(context), _questionBody(context)],
        ));
  }

  Widget _questionBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 556,
      margin: const EdgeInsets.only(top: 60),
      child: Row(
>>>>>>> main
        children: [
          _questionTitle(context, state.title),
          _questionBody(context, state.questions),
        ],
      ),
    );
  }

  Widget _questionBody(BuildContext context, List<Question> questions) {
    final length = questions.length;

    return SizedBox(
<<<<<<< HEAD
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: length - length ~/ 2,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final item = questions[index];
                      return QuestionItem(item: item, index: index + 1);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: length ~/ 2,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final newIndex = index + (length - length ~/ 2);
                      final item = questions[newIndex];
                      return QuestionItem(item: item, index: newIndex + 1);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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
                  "Got questions? We've got answers! Check out our FAQ section to find answers to the most common questions about StreamVibe.",
            ),
          ),
          CommonButton(label: "Ask a question", onTap: () {}),
        ],
      ),
    );
=======
        child: Row(
      children: [
        const Expanded(
          child: CommonTitle(
            title: "Frequently Asked Question",
            subTitle:
                "Got questions? We've got answers! Check out our FAQ section to find answers to the most common questions about StreamVibe.",
          ),
        ),
        CommonButton(label: "Ask a question", onTap: () {})
      ],
    ));
>>>>>>> main
  }
}

class QuestionItem extends ConsumerStatefulWidget {
  const QuestionItem({super.key, required this.item, required this.index});

<<<<<<< HEAD
  final Question item;
=======
  final Map<String, String> item;
>>>>>>> main

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
          padding: const EdgeInsets.all(24),
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


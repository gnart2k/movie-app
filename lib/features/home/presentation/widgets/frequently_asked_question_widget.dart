import 'package:flutter/material.dart';

class QuestionListUi extends StatelessWidget {
  QuestionListUi({super.key});
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
    return Row(children: [
      Container(
          margin: const EdgeInsets.only(top: 120, left: 80, right: 80),
          width: 1280,
          height: 582,
          child: Column(
            children: [_questionTitle(), _questionBody()],
          ))
    ]);
  }

  Widget _questionBody() {
    return Container(
      width: 1280,
      height: 446,
      margin: const EdgeInsets.only(top: 60),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: _bodyList.length ~/ 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = _bodyList[index];
                  return QuestionItem(item: item, index: index + 1);
                },
              ))
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: _bodyList.length ~/ 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = _bodyList[index + 4];
                  return QuestionItem(
                    item: item,
                    index: index + 5,
                  );
                },
              ))
            ],
          ))
        ],
      ),
    );
  }

  Widget _questionTitle() {
    return SizedBox(
        width: 1280,
        height: 76,
        child: Row(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1060,
                  height: 42,
                  child: Text(
                    'Frequently Asked Questions',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        height: 1.5),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 1060,
                  height: 24,
                  child: Text(
                      'Got questions? We\'ve got answers! Check out our FAQ section to find answers to the most common questions about StreamVibe.',
                      style: TextStyle(
                          color: Color(0x99999999),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5)),
                )
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    // padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                    width: 140,
                    height: 49,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE50000),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Ask a Question',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1.5))))
              ],
            ))
          ],
        ));
  }
}

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key, required this.item, required this.index});
  final Map<String, String> item;

  final int index;
  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
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
    question = widget.item.keys.first;
    answer = widget.item[question] ?? 'No answer was found';
  }

  @override
  Widget build(BuildContext context) {
    widget.item;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Color.fromARGB(171, 244, 67, 54),
              ),
            ),
          ),
          width: 620,
          height: currentText == '' ? 120 : 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 54,
                decoration: BoxDecoration(
                    color: const Color(0xFF1F1F1F),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 1, color: const Color(0xFF262626))),
                child: Text('0${widget.index}'),
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
                        fontSize: 20),
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
                          style: const TextStyle(color: Color(0xFF999999)),
                        )
                ],
              )),
              const SizedBox(
                width: 16,
              ),
              IconButton(
                  onPressed: () {
                    showText();
                  },
                  icon: currentText == ''
                      ? const Icon(Icons.add)
                      : const Icon(Icons.remove))
            ],
          ),
        )
      ],
    );
  }
}

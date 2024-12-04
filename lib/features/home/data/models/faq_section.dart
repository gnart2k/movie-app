
class FaqSection {
  final String title;
  final List<Question> questions;

  FaqSection({required this.title, required this.questions});

  factory FaqSection.fromJson(Map<String, dynamic> map) {
    return FaqSection(
        title: map['title'] as String,
        questions: (map['questions'] as List)
            .map((question) => Question.fromJson(question))
            .toList());
  }
}
class Question {
  final String question;
  final String answer;
  Question({required this.question, required this.answer});

  factory Question.fromJson(Map<String, dynamic> map) {
    return Question(
        question: map['question'] as String, answer: map['answer'] as String);
  }
}
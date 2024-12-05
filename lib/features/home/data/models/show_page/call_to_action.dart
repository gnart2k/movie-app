class CallToAction {
  final String text;
  final String button;

  CallToAction({
    required this.text,
    required this.button,
  });

  factory CallToAction.fromJson(Map<String, dynamic> json) {
    return CallToAction(
      text: json['text'] as String,
      button: json['button'] as String,
    );
  }
}

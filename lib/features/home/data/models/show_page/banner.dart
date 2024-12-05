class Banner {
  final String title;
  final List<String> buttons;

  Banner({
    required this.title,
    required this.buttons,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      title: json['title'] as String,
      buttons: List<String>.from(json['buttons'] as List),
    );
  }
}

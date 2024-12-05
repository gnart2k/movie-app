class MovieSection {
  final String title;
  final String description;
  final List<Map<String, dynamic>> buttons;
  final Map<String, dynamic>? details;

  MovieSection({
    required this.title,
    required this.description,
    required this.buttons,
    required this.details,
  });

  factory MovieSection.fromJson(Map<String, dynamic> json) {
    return MovieSection(
      title: json['title'] as String,
      description: json['description'] as String,
      buttons: (json['buttons'] as List).cast<Map<String, dynamic>>(),
      details: json['details'] as Map<String, dynamic>?,
    );
  }
}
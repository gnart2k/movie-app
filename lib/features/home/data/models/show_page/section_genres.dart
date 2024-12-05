class SectionGenres {
  final String type;
  final String title;
  final List<String> genres;

  SectionGenres({
    required this.type,
    required this.title,
    required this.genres,
  });

  factory SectionGenres.fromJson(Map<String, dynamic> json) {
    return SectionGenres(
      type: json['type'] as String,
      title: json['title'] as String,
      genres: List<String>.from(json['genres'] as List),
    );
  }
}

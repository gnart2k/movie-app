class SectionMovies {
  final String type;
  final String title;
  final List<String> movies;

  SectionMovies({
    required this.type,
    required this.title,
    required this.movies,
  });

  factory SectionMovies.fromJson(Map<String, dynamic> json) {
    return SectionMovies(
      type: json['type'] as String,
      title: json['title'] as String,
      movies: List<String>.from(json['movies'] as List),
    );
  }
}

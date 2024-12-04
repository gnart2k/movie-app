class SectionTop10Genres {
  final String type;
  final String title;
  final List<Genre> genres;

  SectionTop10Genres({
    required this.type,
    required this.title,
    required this.genres,
  });

  factory SectionTop10Genres.fromJson(Map<String, dynamic> json) {
    return SectionTop10Genres(
      type: json['type'] as String,
      title: json['title'] as String,
      genres:
          (json['genres'] as List).map((item) => Genre.fromJson(item)).toList(),
    );
  }
}

class Genre {
  final String name;
  final List<String> movies;
  Genre({required this.name, required this.movies});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
        name: json['name'], movies: List<String>.from(json['genres'] as List));
  }
}

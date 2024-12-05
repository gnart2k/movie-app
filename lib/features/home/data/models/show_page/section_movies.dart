import 'package:movie_app/core/domain/model/movie_model.dart';

class Section {
  final String type;
  final String title;
  final List<String>? genres;
  final List<MovieModel>? movies;
  final List<MovieModel>? shows;

  Section({
    required this.type,
    required this.title,
    this.genres,
    this.movies,
    this.shows,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      type: json['type'],
      title: json['title'],
      genres: json['genres']?.cast<String>(),
      movies: (json['movies'] as List?)?.map((e) => MovieModel(name: e, imageUrl: "")).toList(),
      shows: (json['shows'] as List?)?.map((e) => MovieModel(name: e, imageUrl: "")).toList(),
    );
  }
}
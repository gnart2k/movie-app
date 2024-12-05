import 'package:movie_app/features/home/data/models/movie_section.dart';
import 'package:movie_app/features/home/data/sources/movie_section_source.dart';

class MovieSectionRepository {
  final MovieSectionSource _movieSectionSource;

  MovieSectionRepository(this._movieSectionSource);

  Future<MovieSection> getMovieSection() {
    return _movieSectionSource.fetchMovieSection();
  }
}

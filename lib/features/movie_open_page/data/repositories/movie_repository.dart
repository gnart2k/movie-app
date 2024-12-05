import 'package:movie_app/features/movie_open_page/data/models/movie_props.dart';
import 'package:movie_app/features/movie_open_page/data/sources/movie_sources.dart';

class MovieRepository {
  final MovieSource _movieSource;

  MovieRepository(this._movieSource);

  Future<MovieProps> getMovieInfo() {
    return _movieSource.fetchMovieInfo();
  }
}

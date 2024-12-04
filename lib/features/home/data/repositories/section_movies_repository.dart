import 'package:movie_app/features/home/data/models/section_movies.dart';
import 'package:movie_app/features/home/data/sources/section_movies_source.dart';

class SectionMoviesRepository {
  final SectionMoviesSource _sectionMoviesSource;
  SectionMoviesRepository(this._sectionMoviesSource);
  Future<SectionMovies> getSectionMovies() {
    return _sectionMoviesSource.fetchSectionMovies();
  }
}

import 'package:movie_app/features/home/data/models/show_page/section_movies.dart';
import 'package:movie_app/features/home/data/sources/show_page/section_movies_source.dart';

class SectionMoviesRepository {
  final SectionMoviesSource _sectionMoviesSource;
  SectionMoviesRepository(this._sectionMoviesSource);
  Future<SectionMovies> getSectionMovies() {
    return _sectionMoviesSource.fetchSectionMovies();
  }
}

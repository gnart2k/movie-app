import 'package:movie_app/features/home/data/models/section_genres.dart';
import 'package:movie_app/features/home/data/sources/section_genres_source.dart';

class SectionGenresRepository {
  final SectionGenresSource _sectionGenresSource;
  SectionGenresRepository(this._sectionGenresSource);
  Future<SectionGenres> getSectionGenres() {
    return _sectionGenresSource.fetchSectionGenres();
  }
}

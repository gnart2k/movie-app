import 'package:movie_app/features/home/data/models/show_page/section_genres.dart';
import 'package:movie_app/features/home/data/sources/show_page/section_genres_source.dart';

class SectionGenresRepository {
  final SectionGenresSource _sectionGenresSource;
  SectionGenresRepository(this._sectionGenresSource);
  Future<SectionGenres> getSectionGenres() {
    return _sectionGenresSource.fetchSectionGenres();
  }
}

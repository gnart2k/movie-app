import 'package:movie_app/features/home/data/models/show_page/section_top10_genres.dart';
import 'package:movie_app/features/home/data/sources/show_page/section_top10_genres_source.dart';

class SectionTop10GenresRepository {
  final SectionTop10GenresSource _sectionTop10GenresSource;
  SectionTop10GenresRepository(this._sectionTop10GenresSource);
  Future<SectionTop10Genres> getSectionTop10Genres() {
    return _sectionTop10GenresSource.fetchSectionTop10Genres();
  }
}

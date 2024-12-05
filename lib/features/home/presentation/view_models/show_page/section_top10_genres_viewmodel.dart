import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/show_page/section_top10_genres.dart';
import 'package:movie_app/features/home/data/repositories/show_page/section_top10_genres_repository.dart';
import 'package:movie_app/features/home/data/sources/show_page/section_top10_genres_source.dart';

class SectionTop10GenresViewmodel extends StateNotifier<SectionTop10Genres> {
  final SectionTop10GenresRepository _repository;

  SectionTop10GenresViewmodel(this._repository)
      : super(SectionTop10Genres(type: '', title: '', genres: []));

  Future<void> getComparePlans() async {
    try {
      final sectionTop10 = await _repository.getSectionTop10Genres();
      state = sectionTop10;
    } catch (e) {
      state = SectionTop10Genres(type: '', title: '', genres: []);
    }
  }
}

final sectionTop10GenresSourceProvider =
    Provider((ref) => SectionTop10GenresSource());
final sectionTop10GenresRepositoryProvider = Provider(
  (ref) =>
      SectionTop10GenresRepository(ref.read(sectionTop10GenresSourceProvider)),
);
final sectionTop10GenresViewModelProvider =
    StateNotifierProvider<SectionTop10GenresViewmodel, SectionTop10Genres>(
  (ref) => SectionTop10GenresViewmodel(
      ref.read(sectionTop10GenresRepositoryProvider)),
);

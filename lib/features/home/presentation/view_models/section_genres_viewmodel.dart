import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/section_genres.dart';
import 'package:movie_app/features/home/data/repositories/section_genres_repository.dart';
import 'package:movie_app/features/home/data/sources/section_genres_source.dart';

class SectionGenresViewmodel extends StateNotifier<SectionGenres> {
  final SectionGenresRepository _repository;

  SectionGenresViewmodel(this._repository)
      : super(SectionGenres(type: '', title: '', genres: []));

  Future<void> getComparePlans() async {
    try {
      final sectionGenres = await _repository.getSectionGenres();
      state = sectionGenres;
    } catch (e) {
      state = SectionGenres(type: '', title: '', genres: []);
    }
  }
}

final sectionGenresSourceProvider = Provider((ref) => SectionGenresSource());
final sectionGenresRepositoryProvider = Provider(
  (ref) => SectionGenresRepository(ref.read(sectionGenresSourceProvider)),
);
final sectionGenresViewModelProvider =
    StateNotifierProvider<SectionGenresViewmodel, SectionGenres>(
  (ref) => SectionGenresViewmodel(ref.read(sectionGenresRepositoryProvider)),
);

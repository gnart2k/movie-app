import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/section_movies.dart';
import 'package:movie_app/features/home/data/repositories/section_movies_repository.dart';
import 'package:movie_app/features/home/data/sources/section_movies_source.dart';

class SectionMoviesViewmodel extends StateNotifier<SectionMovies> {
  final SectionMoviesRepository _repository;

  SectionMoviesViewmodel(this._repository)
      : super(SectionMovies(type: '', title: '', movies: []));

  Future<void> getComparePlans() async {
    try {
      final sectionMovies = await _repository.getSectionMovies();
      state = sectionMovies;
    } catch (e) {
      state = SectionMovies(type: '', title: '', movies: []);
    }
  }
}

final sectionMoviesSourceProvider = Provider((ref) => SectionMoviesSource());
final sectionMoviesRepositoryProvider = Provider(
  (ref) => SectionMoviesRepository(ref.read(sectionMoviesSourceProvider)),
);
final sectionMoviesViewModelProvider =
    StateNotifierProvider<SectionMoviesViewmodel, SectionMovies>(
  (ref) => SectionMoviesViewmodel(ref.read(sectionMoviesRepositoryProvider)),
);

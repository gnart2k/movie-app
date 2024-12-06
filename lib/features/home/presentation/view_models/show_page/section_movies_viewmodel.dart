import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/show_page/section_movies.dart';
import 'package:movie_app/features/home/data/repositories/show_page/section_movies_repository.dart';
import 'package:movie_app/features/home/data/sources/show_page/section_movies_source.dart';

class SectionMovies {
  final List<Section> sectionMoviesList;

  SectionMovies({required this.sectionMoviesList});
}

class SectionMoviesViewmodel extends StateNotifier<SectionMovies> {
  final SectionMoviesRepository _repository;

  SectionMoviesViewmodel(this._repository)
      : super(SectionMovies(sectionMoviesList: []));

  Future<void> getSectionMovies() async {
    try {
      final sections = await _repository.getSectionMovies();
      state = SectionMovies(sectionMoviesList: sections);
    } catch (e) {
      state = SectionMovies(sectionMoviesList: []);
    }
  }
}

// === Move Providers to global scope ===
final sectionMoviesSourceProvider = Provider<SectionMoviesSource>(
  (ref) => SectionMoviesSource(),
);

final sectionMoviesRepositoryProvider = Provider<SectionMoviesRepository>(
  (ref) => SectionMoviesRepository(ref.read(sectionMoviesSourceProvider)),
);

final sectionMoviesViewModelProvider =
    StateNotifierProvider<SectionMoviesViewmodel, SectionMovies>(
  (ref) => SectionMoviesViewmodel(ref.read(sectionMoviesRepositoryProvider)),
);

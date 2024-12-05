import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/movie_section.dart';
import 'package:movie_app/features/home/data/repositories/movie_section_repository.dart';
import 'package:movie_app/features/home/data/sources/movie_section_source.dart';

class MovieSectionViewmodel extends StateNotifier<MovieSection> {
  final MovieSectionRepository _repository;

  MovieSectionViewmodel(this._repository)
      : super(MovieSection(
            title: '', buttons: [], description: '', details: null));

  Future<void> getMovieSection() async {
    try {
      final source = await _repository.getMovieSection();
      state = source;
    } catch (e) {
      state =
          MovieSection(title: '', buttons: [], description: '', details: null);
    }
  }
}

final sourceProvider = Provider((ref) => MovieSectionSource());
final repositoryProvider = Provider(
  (ref) => MovieSectionRepository(ref.read(sourceProvider)),
);
final movieSectionViewModelProvider =
    StateNotifierProvider<MovieSectionViewmodel, MovieSection>(
  (ref) => MovieSectionViewmodel(ref.read(repositoryProvider)),
);

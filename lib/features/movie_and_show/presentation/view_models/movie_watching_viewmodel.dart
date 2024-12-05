import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../local/share_provider.dart';

class MovieWatchingViewModel extends StateNotifier<List<MovieModel>> {
  MovieWatchingViewModel(this.sharedPreferences) : super([]) {
    _loadMoviesFromPreferences();
  }

  final SharedPreferences? sharedPreferences;

  void _loadMoviesFromPreferences() {
    if (sharedPreferences == null) return null;

    final jsonString = sharedPreferences!.getString("movie");
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      state =  jsonList.map((json) => MovieModel.fromJson(json)).toList();
    }
  }

  void _saveMoviesToPreferences() {
    if (sharedPreferences == null) return;

    final jsonString = jsonEncode(state.map((movie) => movie.toJson()).toList());
    sharedPreferences!.setString("movie", jsonString);
  }

  void toggleMovieList(MovieModel movie) {
    final existingIndex = state.indexWhere((m) => m.name == movie.name);
    if (existingIndex != -1) {
      final updatedList = List<MovieModel>.from(state);
      updatedList[existingIndex] = movie;
      state = updatedList;
    } else {
      state = [...state, movie];
    }
    _saveMoviesToPreferences();
  }
}

final movieWatchingProvider = StateNotifierProvider<MovieWatchingViewModel, List<MovieModel>>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).value;
  return MovieWatchingViewModel(sharedPreferences);
});
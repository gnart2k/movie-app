import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/show_page/section_movies.dart';

class SectionMoviesSource  {
  Future<SectionMovies> fetchSectionMovies() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/show_page.json');
    final dynamic data = json.decode(response)['sections'];
    return SectionMovies.fromJson(data);
  }
}

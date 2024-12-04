import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/section_genres.dart';

class SectionGenresSource {
  Future<SectionGenres> fetchSectionGenres() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/show_page.json');
    final dynamic data = json.decode(response)['sections'];
    return SectionGenres.fromJson(data);
  }
}

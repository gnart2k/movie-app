import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/section_top10_genres.dart';

class SectionTop10GenresSource {
  Future<SectionTop10Genres> fetchSectionTop10Genres() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/show_page.json');
    final dynamic data = json.decode(response)['sections'];
    return SectionTop10Genres.fromJson(data);
  }
}

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/movie_section.dart';

class MovieSectionSource {
  Future<MovieSection> fetchMovieSection() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/page_detail.json');
    final Map<String, dynamic> data = json.decode(response);
    return MovieSection.fromJson(data['movieSection']);
  }
}
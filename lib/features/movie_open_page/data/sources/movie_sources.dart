import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/features/movie_open_page/data/models/movie_props.dart';

class MovieSource {
  Future<MovieProps> fetchMovieInfo() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/page_detail.json');

    final dynamic data = json.decode(response);

    return MovieProps.fromJson(data);
  }
}

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/home_props.dart';

class HomeSource {
  Future<HomeProps> fetchHomeInfo() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/home.json');
    final dynamic data = json.decode(response);
    return HomeProps.fromJson(data);
  }
}

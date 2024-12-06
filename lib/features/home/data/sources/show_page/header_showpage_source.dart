import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/header.dart';

class HeaderShowPageSource {
  Future<HeaderProps> fetchHeaderInfo() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/show_page.json');
    final dynamic data = json.decode(response)['header'];
    return HeaderProps.fromJson(data);
  }
}

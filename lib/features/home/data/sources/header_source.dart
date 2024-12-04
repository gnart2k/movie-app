import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/header.dart';

class HeaderSource {
  Future<HeaderProps> fetchHeaderInfo() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/home.json');
    final dynamic data = json.decode(response)['header'];
    return HeaderProps.fromJson(data);
    // return data.map((json) => HeaderProps.fromJson(json));
  }
}

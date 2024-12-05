import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/show_page/banner.dart';

class BannerSource  {
  Future<Banner> fetchBanner() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/show_page.json');
    final dynamic data = json.decode(response)['banner'];
    return Banner.fromJson(data);
  }
}

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/show_page/footer_showpage.dart';

class FooterShowpageSource {
  Future<FooterShowPage> fetchFooter() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/show_page.json');
    final dynamic data = json.decode(response)['footer'];
    return FooterShowPage.fromJson(data);
  }
}

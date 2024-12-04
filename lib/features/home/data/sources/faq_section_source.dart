import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/faq_section.dart';

class FaqSectionSource {
  Future<FaqSection> fetch() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/home.json');
    final dynamic data = json.decode(response)['faqSection'];
    return FaqSection.fromJson(data);
  }
}
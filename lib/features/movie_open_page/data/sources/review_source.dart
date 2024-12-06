import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/movie_open_page/data/models/review_container.dart';

class ReviewSource {
  Future<ReviewSection> fetchReviewSection() async {
    try {
      final String response =
          await rootBundle.loadString('data/movie-mock/page_seri_detail.json');
      // print("Raw JSON: $response");
      final dynamic data = json.decode(response)['reviewsSection'];
      return ReviewSection.fromJson(data);
    } catch (e) {
      throw Exception('Error fetching Support Form: $e');
    }
  }
}

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/support_page/data/models/support_form.dart';

class SupportFormSource {
  Future<SupportForm> fetchSupportForm() async {
    try {
      final String response =
          await rootBundle.loadString('data/movie-mock/support.json');
      // print("Raw JSON: $response");
      final dynamic data = json.decode(response)['mainSection'];
      return SupportForm.fromJson(data);
    } catch (e) {
      print("error loading json $e");
      throw Exception('Error fetching Support Form: $e');
    }
  }
}

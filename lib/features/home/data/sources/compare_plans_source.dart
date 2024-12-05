import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/compare_plans.dart';

class ComparePlansSource {
  Future<ComparePlans> fetchComparePlans() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/supscription.json');
    final dynamic data = json.decode(response)['comparisonTable'];
    return ComparePlans.fromJson(data);
  }
}

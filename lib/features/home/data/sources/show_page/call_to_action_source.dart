import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/features/home/data/models/show_page/call_to_action.dart';

class CallToActionSource {
  Future<CallToAction> fetchCallToAction() async {
    final String response =
        await rootBundle.loadString('data/movie-mock/show_page.json');
    final dynamic data = json.decode(response)['callToAction'];
    return CallToAction.fromJson(data);
  }
}

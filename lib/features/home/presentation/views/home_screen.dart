import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/header_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HeaderWidgets());
  }
}

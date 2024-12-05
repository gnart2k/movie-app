import 'package:flutter/material.dart';

import '../../../core/widgets/footer_widget.dart';
import '../../../core/widgets/header_widgets.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                child,
                const FooterWidget()
              ],
            ),
          ),
          HeaderWidgets(),
        ],
      ),
    );
  }

}
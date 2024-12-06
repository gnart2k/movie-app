import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/footer_widget.dart';

import '../../../core/widgets/header_widgets.dart';

class AppLayout extends StatefulWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final ScrollController _scrollController = ScrollController();
  bool isChangeColor = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 400) {
      setState(() {
        isChangeColor = true;
      });
    } else {
      setState(() {
        isChangeColor = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [widget.child, const FooterWidget()],
            ),
          ),
          HeaderWidgets(
            isChangeColor: isChangeColor,
          ),
        ],
      ),
    );
  }
}

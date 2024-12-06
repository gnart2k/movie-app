import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class CommonButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  bool enabled = true;

  CommonButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.backgroundColor = AppColors.primary,
      this.enabled = true});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  bool _isPressed = false;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.enabled) {
          widget.onTap();
        }
      },
      onTapDown: (_) {
        if (widget.enabled) {
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (widget.enabled) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovering = true;
        }),
        onExit: (_) => setState(() {
          _isHovering = false;
        }),
        cursor: widget.enabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.linear,
          decoration: BoxDecoration(
              boxShadow: _isHovering
                  ? [
                BoxShadow(
                  color: widget.backgroundColor.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(8,8),
                ),
              ]
                  : [],
              borderRadius: BorderRadius.circular(6),
              color: widget.backgroundColor.withOpacity(_isPressed ? 0.5 : 1)),
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

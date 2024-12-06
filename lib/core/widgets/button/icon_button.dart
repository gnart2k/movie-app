import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  late String? iconUrl;
  late IconData? iconData;

  CustomIconButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.iconData,
      this.iconUrl,
      this.backgroundColor = AppColors.primary});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool isPressed = false;
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovering = true;
        }),
        onExit: (_) => setState(() {
          _isHovering = false;
        }),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
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
            borderRadius: BorderRadius.circular(4),
            color: AppColors.primary.withOpacity(isPressed ? 0.5 : 1),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.iconUrl != null) SvgPicture.asset(widget.iconUrl!),
              if (widget.iconData != null)
                Icon(widget.iconData, color: Colors.white),
              const SizedBox(width: 4),
              Text(widget.label, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HoverableCard extends StatefulWidget {
  final Widget child;
  
  const HoverableCard({super.key, required this.child});

  @override
  State<HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.02 : 1.0),
        child: widget.child,
      ),
    );
  }
}
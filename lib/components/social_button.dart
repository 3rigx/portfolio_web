import 'package:flutter/material.dart';

class SocialButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<SocialButton> createState() => SocialButtonState();
}

class SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
            color: _isHovered ? Colors.black : Colors.white,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovered ? Colors.white : Colors.black,
              fontSize: 6,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

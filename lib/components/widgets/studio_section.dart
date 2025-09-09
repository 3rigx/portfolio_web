// ignore: file_names
import 'package:flutter/material.dart';

import 'blinking_status.dart';

// ignore: camel_case_types
class studioSection extends StatefulWidget {
  final bool show;
  const studioSection({super.key, required this.show});

  @override
  State<studioSection> createState() => _studioSectionState();
}

// ignore: camel_case_types
class _studioSectionState extends State<studioSection>
    with SingleTickerProviderStateMixin {
  bool _showFirst = false;
  bool _showSecond = false;
  bool _showThird = false;
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() => _showFirst = true);
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() => _showSecond = true);
        Future.delayed(const Duration(milliseconds: 600), () {
          setState(() => _showThird = true);
        });
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _bounceAnimation =
        Tween<double>(begin: 0.0, end: -8.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacity(
          opacity: widget.show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: AnimatedSlide(
            offset: widget.show ? Offset.zero : const Offset(-0.2, 0),
            duration: const Duration(milliseconds: 500),
            child: Row(
              children: [
                // Bouncing location icon
                AnimatedBuilder(
                  animation: _bounceAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _bounceAnimation.value),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 28,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Current Location: Ashford, UK',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        AnimatedOpacity(
          opacity: _showThird ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: AnimatedSlide(
            offset: _showThird ? Offset.zero : const Offset(-0.2, 0),
            duration: const Duration(milliseconds: 800),
            child: OutlinedButton(
              onPressed: () {},
              child: const Row(
                children: [
                  BlinkingStatusIndicator(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

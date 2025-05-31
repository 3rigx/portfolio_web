// ignore: file_names
import 'package:flutter/material.dart';

import 'blinking_status.dart';

// ignore: camel_case_types
class studioSection extends StatefulWidget {
  const studioSection({
    super.key,
  });

  @override
  State<studioSection> createState() => _studioSectionState();
}

class _studioSectionState extends State<studioSection> {
  bool _showFirst = false;
  bool _showSecond = false;
  bool _showThird = false;

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
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacity(
          opacity: _showFirst ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: AnimatedSlide(
            offset: _showFirst ? Offset.zero : const Offset(-0.2, 0),
            duration: const Duration(milliseconds: 500),
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('My Studio'),
            ),
          ),
        ),
        const SizedBox(width: 16),
        AnimatedOpacity(
          opacity: _showSecond ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: AnimatedSlide(
            offset: _showSecond ? Offset.zero : const Offset(-0.2, 0),
            duration: const Duration(milliseconds: 800),
            child: OutlinedButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Text('Latest work'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
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

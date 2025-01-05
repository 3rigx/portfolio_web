import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_web/components/case_sturdy_card.dart';

class InfinitDragableSlider extends StatelessWidget {
  const InfinitDragableSlider({
    super.key,
    required this.caseStudies,
  });

  final List<Map<String, dynamic>> caseStudies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 886,
      child: Stack(
        children: List.generate(4, (int index) {
          return Transform.translate(
            offset: const Offset(-70, 30),
            child: Transform.scale(
              scale: 0.6,
              child: Transform.rotate(
                angle: -pi * 0.1,
                child: CaseStudyCard(caseStudy: caseStudies[index]),
              ),
            ),
          );
        }),
      ),
    );
  }
}

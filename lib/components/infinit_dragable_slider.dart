import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_web/components/case_sturdy_card.dart';
import 'package:portfolio_web/components/dragable_widget.dart';

class InfinitDragableSlider extends StatefulWidget {
  const InfinitDragableSlider({
    super.key,
    required this.caseStudies,
    required this.itemBuilder,
    required this.itemCount,
    this.index = 0,
  });

  final List<Map<String, dynamic>> caseStudies;
  final Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final int index;

  @override
  State<InfinitDragableSlider> createState() => _InfinitDragableSliderState();
}

class _InfinitDragableSliderState extends State<InfinitDragableSlider> {
  final double defaultAngle180degre = -pi * 0.1;
  Offset getOffset(int index) {
    return {
        //  0: const Offset(0, 0),
          1: const Offset(-70, 30),
          2: const Offset(70, 30),
        }[index] ??
        const Offset(0, 0);
  }

  double getAngle(int index) {
    return {
          0: 0.0,
          1: defaultAngle180degre,
          2: -defaultAngle180degre,
        }[index] ??
        0.0;
  }

  double getScale(int index) {
    return {
          0: 0.6,
          1: 0.9,
          2: 0.95,
        }[index] ??
        1.0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Stack(
        children: List.generate(3, (int index) {
          return Transform.translate(
            offset: getOffset(index),
            child: Transform.scale(
              scale: getScale(index),
              child: Transform.rotate(
                angle: getAngle(index),
                child: DragableWidget(
                  child: widget.itemBuilder(context, index),
                  // onPressed: onPressed,
                  isEnableDrag: index == 3,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

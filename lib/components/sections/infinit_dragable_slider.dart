import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_web/components/widgets/dragable_widget.dart';

class InfinitDragableSlider extends StatefulWidget {
  const InfinitDragableSlider({
    super.key,
    required this.caseStudies,
    required this.itemBuilder,
    required this.iteamCount,
    this.index = 0, 
  });

  final List<Map<String, dynamic>> caseStudies;
  final Function(BuildContext context, int index) itemBuilder;
  final int iteamCount;
  final int index;

  @override
  State<InfinitDragableSlider> createState() => _InfinitDragableSliderState();
}

class _InfinitDragableSliderState extends State<InfinitDragableSlider>
    with SingleTickerProviderStateMixin {
  final double defaultAngle180degre = -pi * 0.1;

   late AnimationController controller;
  late int index;

  SlideDirection slideDirection = SlideDirection.left;
  Offset getOffset(int stackIndex) {
    return {
         0: Offset(lerpDouble(0, -70, controller.value)!, 30),
          1: Offset(lerpDouble(-70, 70, controller.value)!, 30),
          2: const Offset(70, 30) * (1 - controller.value),
        }[stackIndex] ??
        Offset(
            MediaQuery.of(context).size.width *
                controller.value *
                (slideDirection == SlideDirection.left ? -1 : 1),
            0);
  }

  double getAngle(int stackIndex) =>
      {
        0: lerpDouble(0, -defaultAngle180degre, controller.value),
        1: lerpDouble(
            -defaultAngle180degre, defaultAngle180degre, controller.value),
        2: lerpDouble(defaultAngle180degre, 0, controller.value),
      }[stackIndex] ??
      0.0;

  double getScale(int stackIndex)  =>
      {
        0: lerpDouble(0.6, 0.9, controller.value),
        1: lerpDouble(0.9, 0.95, controller.value),
        2: lerpDouble(0.95, 1, controller.value),
      }[stackIndex] ??
      1.0;
  
  void onSlideOut(SlideDirection direction) {
    slideDirection = direction;
    controller.forward();
  }

  void animationListener() {
    if (controller.isCompleted) {
      // Pretty soon you will get it
      // It helps us to make it infinite slide
      setState(() {
        if (widget.iteamCount == ++index) {
          index = 0;
        }
      });
      controller.reset();
    }
  }

   @override
  void initState() {
    index = widget.index;
    controller =
        AnimationController(vsync: this, duration: kThemeAnimationDuration)
          ..addListener(animationListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      width: 650,
      child: AnimatedBuilder(
         animation: controller,
        builder: (context, _) {
          return Stack(
            children: List.generate(4, (stackIndex) {
                final modIndex = (index + 3 - stackIndex) % widget.iteamCount;
              return Transform.translate(
                offset: getOffset(stackIndex),
                child: Transform.scale(
                  scale: getScale(stackIndex),
                  child: Transform.rotate(
                    angle: getAngle(stackIndex),
                    child: DragableWidget( onSlideOut: onSlideOut,
                      child: widget.itemBuilder(context, modIndex),
                      // onPressed: onPressed,
                      isEnableDrag: stackIndex == 3,
                    ),
                  ),
                ),
              );
            }),
          );
        }
      ),
    );
  }
}

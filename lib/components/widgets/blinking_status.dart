import 'package:flutter/material.dart';
import 'package:portfolio_web/components/widgets/hoverable_card.dart';

class BlinkingStatusIndicator extends StatefulWidget {
  final String text;
  final Color dotColor;
  final double dotSize;

  const BlinkingStatusIndicator({
    super.key,
    this.text = 'Available for new projects',
    this.dotColor = Colors.green,
    this.dotSize = 10.0,
  });

  @override
  State<BlinkingStatusIndicator> createState() =>
      _BlinkingStatusIndicatorState();
}

class _BlinkingStatusIndicatorState extends State<BlinkingStatusIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return HoverableCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) {
                return Container(
                  width:
                      widget.dotSize + 6, // Slightly larger for more visibility
                  height: widget.dotSize + 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.dotColor.withAlpha(
                      (((0.7 + 0.3 * _opacityAnimation.value) * 255).toInt())
                          .clamp(0, 255),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: widget.dotColor.withAlpha(
                          (0.7 * _opacityAnimation.value * 255)
                              .toInt()
                              .clamp(0, 255),
                        ),
                        blurRadius: 16,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

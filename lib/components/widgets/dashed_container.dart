import 'package:flutter/material.dart';

class DashedLineContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final Color lineColor;
  final double lineThickness;
  final double dashWidth;
  
  const DashedLineContainer({
    Key? key,
    required this.child,
    this.height = 200,
    this.lineColor = Colors.white,
    this.lineThickness = 2,
    this.dashWidth = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: double.infinity,
          child: child,
        ),
        CustomPaint(
          size: Size(double.infinity, lineThickness),
          painter: DashUnderscorePainter(
            color: lineColor,
            strokeWidth: lineThickness,
            dashWidth: dashWidth,
          ),
        ),
      ],
    );
  }
}

class DashUnderscorePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;

  DashUnderscorePainter({
    this.color = Colors.white,
    this.strokeWidth = 2,
    this.dashWidth = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double currentX = 0;
    final double height = size.height / 2;
    
    while (currentX < size.width) {
      // Draw the dash at normal height
      canvas.drawLine(
        Offset(currentX, height),
        Offset(currentX + dashWidth, height),
        paint,
      );
      currentX += dashWidth;

      // If we still have space, draw the underscore at lower height
      if (currentX < size.width) {
        canvas.drawLine(
          Offset(currentX, height * 1.5),
          Offset(currentX + dashWidth, height * 1.5),
          paint,
        );
        currentX += dashWidth;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
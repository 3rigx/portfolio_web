import 'package:flutter/material.dart';

class CurvedTopBorderContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double curveHeight;
  final Color backgroundColor;

  const CurvedTopBorderContainer({
    super.key,
    required this.child,
    this.height = 200,
    this.curveHeight = 30,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedTopClipper(curveHeight: curveHeight),
      child: Container(
        height: height,
        color: backgroundColor,
        child: child,
      ),
    );
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  final double curveHeight;

  CurvedTopClipper({this.curveHeight = 30});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, curveHeight); // Start from top-left
    
    // Create the curved line
    path.quadraticBezierTo(
      size.width * 0.5, // Control point x
      0, // Control point y
      size.width, // End point x
      curveHeight, // End point y
    );
    
    // Complete the container shape
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
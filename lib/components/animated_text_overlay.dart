import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// First, ensure your pubspec.yaml has:
// dependencies:
//   lottie: ^3.2.0


// Advanced customizable version
class AnimatedTextOverlay extends StatelessWidget {
  final String text;
  final String lottieUrl;
  final TextStyle textStyle;
  final List<Color> gradientColors;
  final int opacity;

  const AnimatedTextOverlay({
    super.key,
    required this.text,
    required this.lottieUrl,
    this.textStyle = const TextStyle(
      fontSize: 120,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 0.9,
    ),
    this.gradientColors = const [Colors.blue, Colors.purple],
    this.opacity = 07,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Text Layer
            Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle,
            ),

            // Animated Overlay
            Lottie.network(
              lottieUrl,
              fit: BoxFit.cover,
              options: LottieOptions(
                enableMergePaths: true,
              ),
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.opacity(
                    ['**'],
                    value: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

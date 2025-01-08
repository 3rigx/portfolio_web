import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieObject extends StatefulWidget {
  const LottieObject({super.key});

  @override
  State<LottieObject> createState() => _LottieObjectState();
}

class _LottieObjectState extends State<LottieObject> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
        'https://lottie.host/35fef9ef-5560-41dd-a79e-26b268d01a5d/E4x3M0F8do.json',
        fit: BoxFit.cover,
        options: LottieOptions(
          enableMergePaths: true,
        ),
        delegates: LottieDelegates(
          values: [
            ValueDelegate.opacity(
              ['**'],
              value: 40,
            ),
          ],
        ),
      ),
    );
  }
}

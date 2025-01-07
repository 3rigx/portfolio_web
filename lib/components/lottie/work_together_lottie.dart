import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandWaveLottie extends StatefulWidget {
  const HandWaveLottie({super.key});

  @override
  State<HandWaveLottie> createState() => _HandWaveLottieState();
}

class _HandWaveLottieState extends State<HandWaveLottie> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
        'https://lottie.host/140cf19f-be25-465c-90bd-27163e6422d9/3eLEGw0eiA.json',
        fit: BoxFit.cover,
        options: LottieOptions(
          enableMergePaths: true,
        ),
      ),

      //  Lottie.network(
      //   'https://lottie.host/35fef9ef-5560-41dd-a79e-26b268d01a5d/E4x3M0F8do.json',
      //   fit: BoxFit.cover,
      //   options: LottieOptions(
      //     enableMergePaths: true,
      //   ),
      //   delegates: LottieDelegates(
      //     // values: [
      //     //   ValueDelegate.opacity(
      //     //     ['**'],
      //     //     value: 40,
      //     //   ),
      //     // ],
      //   ),
      // ),
    );
  }
}

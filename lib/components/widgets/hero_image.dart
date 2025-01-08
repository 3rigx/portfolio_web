import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'assets/card_per.png', // Replace with your actual image asset
      height: 250,
      fit: BoxFit.contain,
    );
  }
}

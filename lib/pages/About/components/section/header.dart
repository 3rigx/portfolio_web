import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I’m all about creating impactful solutions that blend creativity and precision, I bring energy, expertise, and a focus on delivering results that matter.",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          "I'm Greendly, a skilled software engineer and IT professional from Nigeria",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
     
  
      ],
    );
  }
}


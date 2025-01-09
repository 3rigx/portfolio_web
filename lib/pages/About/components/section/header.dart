import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "IT Professional,\nSpecializing in Software\nDevelopment and Consulting",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
        ),
        const SizedBox(height: 40),
        Text(
          "I'm Greendly, a Software Developer from Nigeria with 5+ years of experience building and delivering high-performance mobile apps and scalable web applications. I've helped  achieve [quantifiable results, e.g., X% increase in efficiency, Y% reduction in costs, etc.] through my expertise in [mention specific technologies/domains]. I enjoy collaborating on challenging projects and finding creative solutions to complex technical problems.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

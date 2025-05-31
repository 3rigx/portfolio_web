import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Professional Title
        Text(
          "IT Professional, Specializing in Software Development and Consulting",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                //   color: Theme.of(context).colorScheme.primary,
                height: 1.2,
              ),
        ),

        const SizedBox(height: 20),

        // Biography
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(
                    (255 * 0.6).toInt(),
                  ),
            borderRadius: BorderRadius.circular(12),
            //  borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                "I'm Greendly, a Software Developer from Nigeria with over 7+ years of experience "
                "creating high-performance mobile apps and scalable web applications. My work has "
                "driven measurable results, such as a 20% increase in sales efficiency through a "
                "Smart CRM application and real-time vote aggregation for election analytics using "
                "technologies like Flutter, React, SQL Server, and Tableau.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      //  fontWeight: FontWeight.w100,
                      height: 1.6,
                      letterSpacing: 0.5,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'I thrive on collaborating on challenging projects, leveraging my expertise '
                'to deliver innovative solutions to complex technical problems.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

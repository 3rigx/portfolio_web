import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          const _ExperienceItem(
            company: 'Workruit',
            role: 'Product Design',
            duration: '2021 - 2024',
            description: 'Creating mid-fidelity wireframes...',
          ),
          const _ExperienceItem(
            company: 'Opera National De Paris',
            role: 'Intern',
            duration: '2018',
            description: 'Exchange Program',
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String company;
  final String role;
  final String duration;
  final String description;

  const _ExperienceItem({super.key, 
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '$role • $duration',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';


class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Interest',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'I enjoy growing and evolving my thoughts, skills, and approaches...',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
         
        ],
      ),
    );
  }
}

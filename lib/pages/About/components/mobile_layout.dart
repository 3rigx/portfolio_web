import 'package:flutter/material.dart';

import 'section/expirence.dart';
import 'section/header.dart';
import 'section/image_carousel.dart';
import 'section/skill.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Hero(
                  tag: 'profile',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'pictures/profile.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const HeaderContent(),
              ],
            ),
          ),
          const ExperienceSection(),
          const SkillsSection(),
          const ImageCarousel(),
        ],
      ),
    );
  }
}

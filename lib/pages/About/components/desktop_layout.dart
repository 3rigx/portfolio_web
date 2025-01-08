import 'package:flutter/material.dart';

import '../../../components/sections/navigation_bar.dart';
import 'section/expirence.dart';
import 'section/header.dart';
import 'section/image_carousel.dart';
import 'section/skill.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 30,
                  horizontal: 120,
                ),
                child: Column(
                  children: [
                    NavigationBarNew(context),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 500,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                HeaderContent(),
                                const ImageCarousel(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 32),
                          Hero(
                            tag: 'profile',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'pictures/profile.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ExperienceSection(),
                    const SkillsSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../components/sections/footer.dart';
import '../../../components/sections/navigation_bar.dart';
import 'section/expirence.dart';
import 'section/header.dart';
import 'section/image_carousel.dart';
import 'section/skill.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavigationBarNew(context),
              Padding(
                padding: EdgeInsets.symmetric(
                  // vertical: 30,
                  horizontal: screenWidth / 7,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: HeaderContent(),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Expanded(
                          flex: 1,
                          child: Hero(
                            tag: 'profile',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'pictures/profile.jpg',
                                fit: BoxFit.fill,
                                // height: 800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const ExperienceSection(),
                    const SkillsSection(),
                  ],
                ),
              ),
              const SizedBox(height: 500, child: FooterSection()),
            ],
          ),
        ),
      ),
    );
  }
}

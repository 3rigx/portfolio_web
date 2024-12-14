import 'package:flutter/material.dart';
import 'package:portfolio_web/components/content_section.dart';
import 'package:portfolio_web/components/hero_image.dart';
import 'package:portfolio_web/components/navigation_bar.dart';
import 'package:portfolio_web/components/studioSection.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 224, 220),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
          child: Column(
            children: [
              // Navigation Bar
              NavigationBarNew(context),

              // Main Content
              LayoutBuilder(
                builder: (context, constraints) {
                  double maxWidth = constraints.maxWidth;
                  bool isWideScreen = maxWidth > 900;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: isWideScreen
                        ? const Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 100),
                                child: Center(child: ContentSection()),
                              ), // Background element
                              Positioned.fill(
                                child: Align(
                                  alignment:
                                      Alignment.center, // Adjust as needed
                                  child: FractionallySizedBox(
                                    widthFactor: 0.5, // Adjust width as needed
                                    child: HeroImage(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Column(
                            children: [
                              ContentSection(),
                              SizedBox(height: 48),
                              HeroImage(),
                            ],
                          ),
                  );
                },
              ),
              const studioSection(),
            ],
          ),
        ),
      ),
    );
  }
}

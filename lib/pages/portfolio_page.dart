import 'package:flutter/material.dart';
import 'package:portfolio_web/components/content_section.dart';
import 'package:portfolio_web/components/hero_image.dart';
import 'package:portfolio_web/components/lottie_comp.dart';
import 'package:portfolio_web/components/navigation_bar.dart';
import 'package:portfolio_web/components/studioSection.dart';

import '../components/animated_text_overlay.dart';
import '../components/case_sturdy_card.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
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
                                      widthFactor:
                                          0.5, // Adjust width as needed
                                      child: LottieObject(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Center(child: ContentSection()),
                                ), // Background element
                                Positioned.fill(
                                  child: Align(
                                    alignment:
                                        Alignment.center, // Adjust as needed
                                    child: FractionallySizedBox(
                                      widthFactor:
                                          0.5, // Adjust width as needed
                                      child: LottieObject(),
                                    ),
                                  ),
                                ),
                              ],
                            ));
                },
              ),
              const studioSection(),
              const SizedBox(
                height: 10,
              ),

              Container(
                height: 886,
                child: CaseStudyCard(),
              ),


              //const SizedBox(height: 200, child: WaterTextEffectPage()),
            ],
          ),
        ),
      ),
    );
  }
}

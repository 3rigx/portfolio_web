import 'package:flutter/material.dart';
import 'package:portfolio_web/components/widgets/hoverable_card.dart';

import '../../../components/sections/footer.dart';
import '../../../components/sections/navigation_bar.dart';
import '../../../components/widgets/curved_coontianer.dart';
import '../../../components/widgets/dashed_container.dart';
import '../../../theme/app_theme.dart';
import 'section/expirence.dart';
import 'section/header.dart';
import 'section/testimonials.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        decoration: AppTheme.glowingContainer,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
                vertical: 30,
              ),
              child: NavigationBarNew(context),
            ),
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
                        child: HoverableCard(
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const ExperienceSection(),
                  const SizedBox(height: 20),
                  const CurvedTopBorderContainer(
                    height: 400,
                    curveHeight: 40,
                    backgroundColor: Color(0xFF1A1A1A),
                    child: Center(
                      child: Text(
                        'payment infrastructure',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  DashedLineContainer(
                    height: 400,
                    lineColor: Colors.green, // Or any color you prefer
                    lineThickness: 2,
                    dashWidth: 20,
                    child: Container(
                      color: Colors.black,
                      child: const Center(
                        child: Text(
                          'payment infrastructure',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            const TestimonialsAndBrands(),
            const SizedBox(height: 500, child: FooterSection()),
          ],
        ),
      ),
    );
  }
}

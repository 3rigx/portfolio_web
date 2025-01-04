import 'package:flutter/material.dart';

import 'case_sturdy_card.dart';

class CaseStudyCarousel extends StatefulWidget {
  const CaseStudyCarousel({super.key});

  @override
  State<CaseStudyCarousel> createState() => _CaseStudyCarouselState();
}

class _CaseStudyCarouselState extends State<CaseStudyCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  // Sample list of case studies - you can expand this
  final List<Map<String, dynamic>> caseStudies = [
    {
      'id': '01',
      'images': ['assets/asset1.jpg', 'assets/asset2.jpg'],
    },
    {
      'id': '02',
      'images': ['assets/asset3.jpg', 'assets/asset4.jpg'],
    },
    {
      'id': '03',
      'images': ['assets/asset5.jpg', 'assets/asset6.jpg'],
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 600, // Adjust height as needed
          child: PageView.builder(
            controller: _pageController,
            itemCount: caseStudies.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(value) * 600,
                      width: Curves.easeInOut.transform(value) * 800,
                      child: child,
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CaseStudyCard(),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        // Carousel Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                caseStudies.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor:
                        _currentPage == index ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
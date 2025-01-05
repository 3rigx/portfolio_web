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

  final List<Map<String, dynamic>> caseStudies = [
    {
      'id': '01',
      'title': 'Empowered 500k Users with AI-Enhanced Resume Builder',
      'images': ['assets/asset1.jpg', 'assets/asset2.jpg'],
      'statistics': [
        {
          'percentage': '12%',
          'description': 'Click rates for\nJob Description and AI writer'
        },
        {'percentage': '5%', 'description': 'Increase in\nresume building'}
      ],
      'tags': ['MOBILE', 'WEB', '500K MAU']
    },
    {
      'id': '02',
      'title': 'AI-Powered Job Matching Platform',
      'images': ['assets/asset1.jpg', 'assets/asset2.jpg'],
      'statistics': [
        {
          'percentage': '25%',
          'description': 'Increase in\nsuccessful placements'
        },
        {'percentage': '15%', 'description': 'Reduction in\nhiring time'}
      ],
      'tags': ['AI', 'ENTERPRISE', '1M MAU']
    },
    // Add more case studies as needed
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CaseStudyCard(caseStudy: caseStudies[index]),
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

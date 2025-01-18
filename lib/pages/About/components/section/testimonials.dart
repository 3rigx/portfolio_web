import 'package:flutter/material.dart';
import 'package:portfolio_web/components/widgets/hoverable_card.dart';

import '../../../../theme/app_colors.dart';

class TestimonialsAndBrands extends StatefulWidget {
  const TestimonialsAndBrands({super.key});

  @override
  State<TestimonialsAndBrands> createState() => _TestimonialsAndBrandsState();
}

class _TestimonialsAndBrandsState extends State<TestimonialsAndBrands> {
  final List<TestimonialData> testimonials = [
    TestimonialData(
      text:
          "Jaykay's dedication to design is evident and truly inspiring. The eagerness to tackle the steep learning curve at Pugpig and adapt to feedback stands out.",
      author: "Harry Phillips",
      role: "Head of Product (Pugpig)",
    ),
    TestimonialData(
      text:
          "Jaykay is a highly talented product designer, known for his remarkable creativity and ease of collaboration.",
      author: "Christian Nwamba",
      role: "Senior Advocacy Amazon",
    ),
    TestimonialData(
      text:
          "Jaykay is a highly talented product designer, known for his remarkable creativity and ease of collaboration.",
      author: "Christian Nwamba",
      role: "Senior Advocacy Amazon",
    ),
    TestimonialData(
      text:
          "Jaykay is a highly talented product designer, known for his remarkable creativity and ease of collaboration.",
      author: "Christian Nwamba",
      role: "Senior Advocacy Amazon",
    ),
    TestimonialData(
      text:
          "Jaykay is a highly talented product designer, known for his remarkable creativity and ease of collaboration.",
      author: "Christian Nwamba",
      role: "Senior Advocacy Amazon",
    ),
    TestimonialData(
      text:
          "Jaykay is a highly talented product designer, known for his remarkable creativity and ease of collaboration.",
      author: "Christian Nwamba",
      role: "Senior Advocacy Amazon",
    ),
    TestimonialData(
      text:
          "Jaykay is a highly talented product designer, known for his remarkable creativity and ease of collaboration.",
      author: "Christian Nwamba",
      role: "Senior Advocacy Amazon",
    ),
    TestimonialData(
      text:
          "Jaykay is a highly talented product designer, known for his remarkable creativity and ease of collaboration.",
      author: "Christian Nwamba",
      role: "Senior Advocacy Amazon",
    ),
    // Add more testimonials as needed
  ];

  final List<String> brands = [
    'Aso Savings & Loans',
    'Daily Trust',
    'Leadership Newspaper',
    'Nutrition Society of Nigeria',
    'Softsmart Business Solutions',
    'Smart Energy',
    'UniqGlow',
    'Da Kulture Models',
    'Tripple Hands',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Testimonials From Peers & Coworkers',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        //  fontSize: 36,
                        // fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Here are a few kind words people have to say about collaborating and solving problems with me.',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          height: 1.6,
                          letterSpacing: 0.5,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: AutoScrollingList(
                scrollSpeed: 3.0,
                itemCount: testimonials.length,
                rightToLeft: true,
                itemBuilder: (context, index) {
                  return HoverableCard(
                      child: TestimonialCard(testimonial: testimonials[index]));
                },
              ),
            ),
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Some brands I\'ve worked with...',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 58,
              child: AutoScrollingList(
                scrollSpeed: 3.5,
                itemCount: brands.length,
                rightToLeft: false,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: HoverableCard(child: BrandLogo(name: brands[index])),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class AutoScrollingList extends StatefulWidget {
  final int itemCount;
  final bool rightToLeft;
  final Widget Function(BuildContext, int) itemBuilder;
  final double scrollSpeed;

  const AutoScrollingList({
    super.key,
    required this.itemCount,
    required this.rightToLeft,
    required this.itemBuilder,
    this.scrollSpeed = 2.0,
  });

  @override
  State<AutoScrollingList> createState() => _AutoScrollingListState();
}

class _AutoScrollingListState extends State<AutoScrollingList> {
  late ScrollController _scrollController;
  late double _maxScrollExtent;
  bool _isScrolling = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() async {
    while (_isScrolling) {
      if (!mounted) return;

      if (_scrollController.hasClients) {
        _maxScrollExtent = _scrollController.position.maxScrollExtent;

        if (widget.rightToLeft) {
          double nextPosition = _scrollController.offset + widget.scrollSpeed;
          await _scrollController.animateTo(
            nextPosition,
            duration: const Duration(milliseconds: 16),
            curve: Curves.linear,
          );

          // If we're close to the end, jump back by the width of the visible items
          if (nextPosition >= _maxScrollExtent - 50) {
            final jumpTarget = nextPosition - (_maxScrollExtent / 2);
            _scrollController.jumpTo(jumpTarget);
          }
        } else {
          double nextPosition = _scrollController.offset - widget.scrollSpeed;
          await _scrollController.animateTo(
            nextPosition,
            duration: const Duration(milliseconds: 16),
            curve: Curves.linear,
          );

          // If we're close to the start, jump forward by the width of the visible items
          if (nextPosition <= 50) {
            final jumpTarget = nextPosition + (_maxScrollExtent / 2);
            _scrollController.jumpTo(jumpTarget);
          }
        }
      }

      await Future.delayed(const Duration(milliseconds: 16));
    }
  }

  @override
  void dispose() {
    _isScrolling = false;
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Display three sets of items to create the illusion of infinite scrolling
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: widget.itemCount * 3, // Triple the items
      itemBuilder: (context, index) {
        // Use modulo to repeat the items
        return widget.itemBuilder(context, index % widget.itemCount);
      },
    );
  }
}

class TestimonialData {
  final String text;
  final String author;
  final String role;

  TestimonialData({
    required this.text,
    required this.author,
    required this.role,
  });
}

class TestimonialCard extends StatelessWidget {
  final TestimonialData testimonial;

  const TestimonialCard({
    super.key,
    required this.testimonial,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.surface.withOpacity(0.6),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testimonial.text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            testimonial.author,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            testimonial.role,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 12,
                  color: AppColors.text.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }
}

class BrandLogo extends StatelessWidget {
  final String name;

  const BrandLogo({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(5, 5),
          child: Container(
            width: 240,
            decoration: BoxDecoration(
              color: AppColors.dark.withOpacity(0.9),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: 240,
            decoration: BoxDecoration(
              color: AppColors.dark.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                name,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

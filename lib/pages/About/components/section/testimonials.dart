import 'package:flutter/material.dart';

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
    'Deimos',
    'Modus Create',
    'Bitsika',
    'Microsoft',
    'AKQA',
    'Cloudinary',
    'Cloudinary',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Testimonials From Peers & Coworkers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Here are a few kind words people have to say about collaborating and solving problems with me.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: AutoScrollingList(
              itemCount: testimonials.length,
              rightToLeft: true,
              itemBuilder: (context, index) {
                return TestimonialCard(testimonial: testimonials[index]);
              },
            ),
          ),
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Some brands I\'ve worked with...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: AutoScrollingList(
              itemCount: brands.length,
              rightToLeft: false,
              itemBuilder: (context, index) {
                return BrandLogo(name: brands[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AutoScrollingList extends StatefulWidget {
  final int itemCount;
  final bool rightToLeft;
  final Widget Function(BuildContext, int) itemBuilder;

  const AutoScrollingList({
    super.key,
    required this.itemCount,
    required this.rightToLeft,
    required this.itemBuilder,
  });

  @override
  State<AutoScrollingList> createState() => _AutoScrollingListState();
}

class _AutoScrollingListState extends State<AutoScrollingList> {
  late ScrollController _scrollController;
  late double _maxScrollExtent;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() async {
    _maxScrollExtent = _scrollController.position.maxScrollExtent;
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (!mounted) return;

      if (widget.rightToLeft) {
        if (_scrollController.offset >= _maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            _scrollController.offset + 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      } else {
        if (_scrollController.offset <= 0) {
          _scrollController.jumpTo(_maxScrollExtent);
        } else {
          _scrollController.animateTo(
            _scrollController.offset - 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
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
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testimonial.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            testimonial.author,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            testimonial.role,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
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
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

class MultiCardSlideshow extends StatefulWidget {
  const MultiCardSlideshow({super.key});

  @override
  State<MultiCardSlideshow> createState() => _MultiCardSlideshowState();
}

class _MultiCardSlideshowState extends State<MultiCardSlideshow> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  // Image list for all cards
  final List<String> allImages =
      List.generate(21, (index) => 'pictures/image${index + 1}.jpg');

  // Divide images into groups of 3 for each slide
  late List<List<List<String>>> slideGroups;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8, // This creates the peek effect
      initialPage: 1000, // Start at a large number for "infinite" scroll
    );
    _organizeSlideGroups();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _organizeSlideGroups() {
    slideGroups = [];
    int totalImages = allImages.length;
    int imagesPerCard = 7;

    for (int i = 0; i < totalImages; i += 3) {
      if (i + 2 < totalImages) {
        List<List<String>> slideCards = [];

        for (int cardIndex = 0; cardIndex < 3; cardIndex++) {
          int startIndex = (i + (cardIndex * imagesPerCard)) % totalImages;
          List<String> cardImages = [];

          for (int imageIndex = 0; imageIndex < imagesPerCard; imageIndex++) {
            int currentIndex = (startIndex + imageIndex) % totalImages;
            cardImages.add(allImages[currentIndex]);
          }

          slideCards.add(cardImages);
        }

        slideGroups.add(slideCards);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoSlideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, slideIndex) {
              // Use modulo to wrap around the slideGroups
              final actualIndex = slideIndex % slideGroups.length;
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;

                  // Calculate the sliding value for animation
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - slideIndex;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }

                  return Center(
                    child: SizedBox(
                      height: Curves.easeOut.transform(value) * 500,
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (cardIndex) => Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ImageCard(
                              images: slideGroups[actualIndex][cardIndex],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Custom carousel indicators
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              slideGroups.length,
              (index) => GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    _currentPage - (_currentPage % slideGroups.length) + index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(
                      _currentPage % slideGroups.length == index ? 0.9 : 0.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageCard extends StatefulWidget {
  final List<String> images;

  const ImageCard({
    super.key,
    required this.images,
  });

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  late Timer _timer;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _startImageRotation();
  }

  void _startImageRotation() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentImageIndex = (_currentImageIndex + 1) % widget.images.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 400,
        padding: const EdgeInsets.all(8),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: ClipRRect(
            key: ValueKey<int>(_currentImageIndex),
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget.images[_currentImageIndex],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

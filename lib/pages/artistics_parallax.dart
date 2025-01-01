import 'package:flutter/material.dart';

class SlideData {
  final String title;
  final String subtitle;
  final String description;
  final String mainImage;
  final String overlayImage;
  final Color backgroundColor;

  SlideData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.mainImage,
    required this.overlayImage,
    required this.backgroundColor,
  });
}

class ArtisticParallaxSlider extends StatefulWidget {
  const ArtisticParallaxSlider({super.key});

  @override
  State<ArtisticParallaxSlider> createState() => _ArtisticParallaxSliderState();
}

class _ArtisticParallaxSliderState extends State<ArtisticParallaxSlider>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _textAnimationController;
  late AnimationController _imageAnimationController;
  late AnimationController _overlayZoomController;
  int _currentPage = 0;
  bool _isAnimating = false;

  final List<SlideData> slides = [
    SlideData(
      title: 'Vintage\nCamera',
      subtitle: 'PHOTOGRAPHY',
      description: 'Capture life through the lens',
      mainImage: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f',
      overlayImage:
          'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/cameras/canon-ae-1.png',
      backgroundColor: const Color(0xFF1A1A1A),
    ),
    SlideData(
      title: 'Classic\nWristwatch',
      subtitle: 'TIMEPIECE',
      description: 'Timeless elegance in every detail',
      mainImage: 'https://images.unsplash.com/photo-1492691527719-9d1e07e534b4',
      overlayImage:
          'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/watches/watch-1.png',
      backgroundColor: const Color(0xFF2A2A2A),
    ),
    SlideData(
      title: 'Modern\nHeadphones',
      subtitle: 'AUDIO',
      description: 'Immerse yourself in sound',
      mainImage: 'https://images.unsplash.com/photo-1433086966358-54859d0ed716',
      overlayImage:
          'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/headphones/headphone-1.png',
      backgroundColor: const Color(0xFF1A1A1A),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _overlayZoomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed && _isAnimating) {
          _scrollToNextPage();
        }
      });

    _startAnimations();
  }

  void _startAnimations() {
    _textAnimationController.forward();
    _imageAnimationController.forward();
    _startOverlayZoomAnimation();
  }

  void _startOverlayZoomAnimation() {
    _isAnimating = true;
    _overlayZoomController.forward(from: 0.0);
  }

  void _resetAnimations() {
    _textAnimationController.reset();
    _imageAnimationController.reset();
    _overlayZoomController.reset();
    _startAnimations();
  }

  void _scrollToNextPage() {
    final screenHeight = MediaQuery.of(context).size.height;
    final nextPage = _currentPage + 1;

    if (nextPage < slides.length) {
      _isAnimating = true;
      _scrollController.animateTo(
        nextPage * screenHeight,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOut,
      );
    } else {
      _isAnimating = true;
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onScroll() {
    final screenHeight = MediaQuery.of(context).size.height;
    final page = (_scrollController.offset / screenHeight).round();
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
        _resetAnimations();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textAnimationController.dispose();
    _imageAnimationController.dispose();
    _overlayZoomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: slides.length,
            itemBuilder: (context, index) {
              final scrollProgress = _scrollController.hasClients
                  ? (_scrollController.offset - (index * screenHeight)) /
                      screenHeight
                  : 0.0;

              return SizedBox(
                height: screenHeight,
                child: SlideItem(
                  slide: slides[index],
                  textAnimation: _textAnimationController,
                  imageAnimation: _imageAnimationController,
                  overlayZoomAnimation: _overlayZoomController,
                  scrollProgress: scrollProgress,
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index ? Colors.white : Colors.white38,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final SlideData slide;
  final AnimationController textAnimation;
  final AnimationController imageAnimation;
  final AnimationController overlayZoomAnimation;
  final double scrollProgress;

  const SlideItem({
    super.key,
    required this.slide,
    required this.textAnimation,
    required this.imageAnimation,
    required this.overlayZoomAnimation,
    required this.scrollProgress,
  });

  @override
  Widget build(BuildContext context) {
    final overlayZoomTween = Tween<double>(begin: 1.0, end: 1.3);
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: slide.backgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image with reduced opacity
          Transform.translate(
            offset: Offset(0, scrollProgress * -100),
            child: SlideInTransition(
              animation: imageAnimation,
              child: Container(
                foregroundDecoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Image.network(
                  slide.mainImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Centered Overlay Image with Zoom
          Center(
            child: Transform.translate(
              offset: Offset(scrollProgress * 150, 0),
              child: ScaleTransition(
                scale: overlayZoomTween.animate(CurvedAnimation(
                  parent: overlayZoomAnimation,
                  curve: Curves.easeInOut,
                )),
                child: RotationTransition(
                  turns: Tween(begin: 0.1, end: 0.0).animate(
                    CurvedAnimation(
                      parent: imageAnimation,
                      curve: Curves.easeOutBack,
                    ),
                  ),
                  child: SizedBox(
                    width: screenSize.width * 0.6,
                    height: screenSize.height * 0.6,
                    child: Image.network(
                      slide.overlayImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Text Content
          Positioned(
            left: 50,
            top: 100,
            child: Transform.translate(
              offset: Offset(0, scrollProgress * 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideInTransition(
                    animation: textAnimation,
                    offsetDirection: const Offset(0, -1),
                    child: Text(
                      slide.subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SlideInTransition(
                    animation: textAnimation,
                    offsetDirection: const Offset(0, 1),
                    child: Text(
                      slide.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SlideInTransition(
                    animation: textAnimation,
                    offsetDirection: const Offset(0, 1),
                    child: Text(
                      slide.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideInTransition extends StatelessWidget {
  final Widget child;
  final AnimationController animation;
  final Offset offsetDirection;

  const SlideInTransition({
    super.key,
    required this.child,
    required this.animation,
    this.offsetDirection = const Offset(0, 1),
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: offsetDirection,
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      )),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

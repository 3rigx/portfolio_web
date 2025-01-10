import 'package:flutter/material.dart';
import 'dart:async';

class RecursiveImageList extends StatefulWidget {
  const RecursiveImageList({super.key});

  @override
  State<RecursiveImageList> createState() => _RecursiveImageListState();
}

class _RecursiveImageListState extends State<RecursiveImageList>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final List<String> allImages =
      List.generate(29, (index) => 'pictures/image${index + 1}.jpg');
  Timer? _scrollTimer;

  // Define fixed dimensions
  static const double cardWidth = 180.0;
  static const double cardHeight = 120.0;
  static const double cardSpacing = 120.0;

  @override
  void initState() {
    super.initState();
    _startContinuousScroll();
  }

  void _startContinuousScroll() {
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      if (_scrollController.hasClients) {
        final double currentPosition = _scrollController.offset;
        final double maxScroll = _scrollController.position.maxScrollExtent;

        if (currentPosition >= maxScroll - 1) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(currentPosition + 1);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  List<String> _getImagesForCard(int index) {
    const int imagesPerCard = 7;
    List<String> cardImages = [];

    for (int i = 0; i < imagesPerCard; i++) {
      int imageIndex = (index * imagesPerCard + i) % allImages.length;
      cardImages.add(allImages[imageIndex]);
    }

    return cardImages;
  }

  @override
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int numberOfSets =
        (screenWidth / (cardWidth + cardSpacing)).ceil() + 2;
    const int totalCards = 10;

    return SizedBox(
      height: cardHeight,
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCards * numberOfSets,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: cardSpacing / 10),
                child: SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: TransitionImageCard(
                    images: _getImagesForCard(index % totalCards),
                  ),
                ),
              );
            },
          ),
          Positioned.fill(
              child: IgnorePointer(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white70,
                    Colors.white70,
                    Colors.white.withOpacity(0),
                  ],
                  stops: const [0.0, 0.15, 0.85, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstOut,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white70,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white70,
                    ],
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class TransitionImageCard extends StatefulWidget {
  final List<String> images;

  const TransitionImageCard({
    super.key,
    required this.images,
  });

  @override
  State<TransitionImageCard> createState() => _TransitionImageCardState();
}

class _TransitionImageCardState extends State<TransitionImageCard> {
  late Timer _timer;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _startImageTransition();
  }

  void _startImageTransition() {
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Image.asset(
              widget.images[_currentImageIndex],
              key: ValueKey<int>(_currentImageIndex),
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}

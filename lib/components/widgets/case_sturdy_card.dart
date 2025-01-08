import 'package:flutter/material.dart';

class CaseStudyCard extends StatefulWidget {
  final Map<String, dynamic> caseStudy;
  const CaseStudyCard({super.key, required this.caseStudy});

  @override
  State<CaseStudyCard> createState() => _CaseStudyCardState();
}

class _CaseStudyCardState extends State<CaseStudyCard> {
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start the background animation
    _startBackgroundAnimation();
  }

  void _startBackgroundAnimation() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          currentImageIndex =
              ((currentImageIndex + 1) % widget.caseStudy['images'].length)
                  .toInt();
        });
        _startBackgroundAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Stack(
                fit: StackFit.expand, // Added this to make Stack fill container
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      widget.caseStudy['images'][currentImageIndex],
                      key: ValueKey<int>(currentImageIndex),
                      fit: BoxFit.cover, // Changed from fill to cover
                      width: double.infinity, // Added to ensure full width
                      height: double.infinity, // Added to ensure full height
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 0, // Added this
                    right: 0, // Added this
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // Added this
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Insights section
                              const Text(
                                'INSIGHTS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...widget.caseStudy['statistics']
                                  .map<Widget>(
                                    (stat) => Column(
                                      children: [
                                        _buildStatistic(
                                          stat['percentage'],
                                          stat['description'],
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  )
                                  .toList(),
                              // // Statistics
                              // _buildStatistic('12%',
                              //     'Click rates for\nJob Description and AI writer'),
                              // const SizedBox(height: 16),
                              // _buildStatistic(
                              //     '5%', 'Increase in\nresume building'),
                            ],
                          ),
                          Row(
                            children: [
                              _buildControlButton('Live View'),
                              const SizedBox(width: 8),
                              _buildControlButton('Sound'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24.0,
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CASE STUDY ${widget.caseStudy['id']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.caseStudy['title'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            ...widget.caseStudy['tags']
                                .map(
                                  (tag) => Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: _buildTag(tag),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildViewCaseButton(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(String percentage, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          percentage,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Row(
      children: [
        const Icon(
          Icons.donut_small_sharp,
          color: Colors.black,
          size: 10,
          weight: 88,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildControlButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: text == 'Sound' ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: text == 'Sound' ? Colors.black : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (text == 'Sound') ...[
            const SizedBox(width: 4),
            Icon(
              Icons.play_arrow,
              size: 16,
              color: text == 'Sound' ? Colors.black : Colors.white,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildViewCaseButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View Case Study',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.arrow_outward_sharp,
              size: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

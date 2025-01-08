import 'package:flutter/material.dart';

import '../image_carousel_view.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: MultiCardSlideshow(),
    );
  }
}

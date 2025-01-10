import 'package:flutter/material.dart';

import 'components/desktop_layout.dart';
import 'components/mobile_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 224, 220),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return const DesktopLayout();
          }
          return const MobileLayout();
        },
      ),
    );
  }
}

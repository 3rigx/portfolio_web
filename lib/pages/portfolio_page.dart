import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:portfolio_web/components/sections/content_section.dart';
import 'package:portfolio_web/components/sections/infinit_dragable_slider.dart';
import 'package:portfolio_web/components/lottie/lottie_comp.dart';
import 'package:portfolio_web/components/sections/my_stacks.dart';
import 'package:portfolio_web/components/sections/navigation_bar.dart';
import 'package:portfolio_web/components/widgets/studio_section.dart';

import '../components/widgets/case_sturdy_card.dart';
import '../components/sections/footer.dart';
import '../theme/app_theme.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final List<Map<String, dynamic>> caseStudies = [
    {
      'id': '01',
      'title': 'Cosmetic brand Flawless - Created with Wordpress',
      'images': ['assets/flawless3.jpg', 'assets/flawless2.jpeg'],
      'statistics': [
        {
          'percentage': '62%',
          'description': 'An online beauty \nand skincare shop.'
        },
        {
          'percentage': '5 Stars',
          'description': 'The website includes \nmultiple customer reviews'
        }
      ],
      'tags': ['MOBILE', 'WEB', '500K MAU']
    },
    {
      'id': '02',
      'title':
          'logistics company dedicated to fast, secure, and reliable shipping, Built with Wordpress.',
      'images': ['assets/parcelkeepers1.jpeg', 'assets/parcelkeepers2.jpeg'],
      'statistics': [
        {
          'percentage': '24/7',
          'description': 'Customer support\nReal-time tracking\nglobal reach'
        },
        {'percentage': '1.9%', 'description': 'Click rates'}
      ],
      'tags': ['MOBILE', 'WEB', '500K MAU']
    },
    {
      'id': '03',
      'title': 'Royal Express Logistics, Built with FLutter.',
      'images': ['assets/royalexpress1.png', 'assets/royalexpress3.png'],
      'statistics': [
        {
          'percentage': '25%',
          'description': 'Increase in\nsuccessful placements'
        },
        {'percentage': '15%', 'description': 'Reduction in\ndelivery time'}
      ],
      'tags': ['LOGISTICS', 'SHIPPING','ENTERPRISE', 'MOBILE', 'WEB', 'FLUTTER']
    },
    {
      'id': '04',
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
      'id': '05',
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
      'id': '06',
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
      'id': '07',
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
      'id': '08',
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
      'id': '09',
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
      'id': '10',
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

    // Add more case studies as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: AppTheme.glowingContainer,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
                  child: Column(
                    children: [
                      // Navigation Bar
                      NavigationBarNew(context),

                      // Main Content
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double maxWidth = constraints.maxWidth;
                          bool isWideScreen = maxWidth > 900;

                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              child: isWideScreen
                                  ? const Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 100),
                                          child:
                                              Center(child: ContentSection()),
                                        ), // Background element
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment
                                                .center, // Adjust as needed
                                            child: SizedBox(
                                              height: 800,
                                              width: double.infinity,
                                              child: Center(
                                                child: SizedBox(
                                                  height: 500,
                                                  width: double.infinity,
                                                  child: Tooltip(
                                                    message:
                                                        'You can interact with it!, Click to reveal my Middle name.',
                                                    child: ModelViewer(
                                                      src:
                                                          'assets/3dmodel/liquid_gem.glb',
                                                      alt: "A 3D model",
                                                      ar: true,
                                                      autoRotate: true,
                                                      cameraControls: true,
                                                      shadowIntensity: 1,
                                                      autoPlay: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      loading: Loading.eager,
                                                      disableZoom: true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //place 3d model
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child:
                                              Center(child: ContentSection()),
                                        ), // Background element
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment
                                                .center, // Adjust as needed
                                            child: FractionallySizedBox(
                                              widthFactor:
                                                  0.5, // Adjust width as needed
                                              child: LottieObject(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                        },
                      ),
                      const studioSection(),
                      const SizedBox(
                        height: 10,
                      ),
                      InfinitDragableSlider(
                        caseStudies: caseStudies,
                        itemBuilder: (context, index) =>
                            CaseStudyCard(caseStudy: caseStudies[index]),
                        iteamCount: caseStudies.length,
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      const SizedBox(height: 650, child: MyStacks()),

                      // const SizedBox(
                      //   height: 886,
                      //   child: CaseStudyCarousel(),
                      // ),

                      //const SizedBox(height: 200, child: WaterTextEffectPage()),
                    ],
                  ),
                ),
                const SizedBox(height: 500, child: FooterSection()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

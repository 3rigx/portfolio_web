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
      'title': 'Election Projection System- Built with react - Tableau - SQL',
      'images': ['assets/election1.png', 'assets/election2.png'],
      'statistics': [
        {
          'percentage': '85%',
          'description': 'Election Projection\n Succes rate'
        },
        {
          'percentage': '75%',
          'description': 'Increase in\nward level projections'
        }
      ],
      'tags': [
        'TABLEAU',
        'WEB',
        'SQL',
        'REACTJS',
        'DATA ANALYTICS',
        'ELECTION PROJECTION'
      ]
    },
    {
      'id': '02',
      'title': 'Hotel Management System - Built with Flutter',
      'images': ['assets/hotel1.png', 'assets/hotel2.png'],
      'statistics': [
        {
          'percentage': '32%',
          'description': 'Increased Revenue \nand Profitability'
        },
        {
          'percentage': '20%',
          'description': 'Improved Operational \nEfficiency'
        }
      ],
      'tags': ['MOBILE', 'WEB', '500K MAU']
    },
    {
      'id': '03',
      'title': 'SmartCRM - comprehensive CRM system',
      'images': ['assets/crm2.jpg', 'assets/crm6.jpg'],
      'statistics': [
        {'percentage': '42%', 'description': 'Increase in\nSales Management'},
        {
          'percentage': '85%',
          'description': 'Increase in\nInsights and Analytics'
        }
      ],
      'tags': [
        'ERP Integration',
        'WEB',
        'Data Analytics',
        'SQL',
        'Local Server',
        'ReactJS'
      ]
    },

    {
      'id': '04',
      'title':
          'Luminova Trust Capital | Financial Solutions & Investment Services Built with Flutter',
      'images': ['assets/lumi3.png', 'assets/lumi4.png'],
      'statistics': [
        {
          'percentage': '12%',
          'description': 'Raised capital\nfrom MassChallenge'
        },
        {
          'percentage': '',
          'description': 'Business brokerage\nfinancial consulting'
        }
      ],
      'tags': ['MOBILE', 'WEB', 'Financial Solutions', 'Investment Services']
    },
    {
      'id': '05',
      'title':
          'OnlyBandOption | Cryptocurrency & Investment Services Built with Flutter',
      'images': ['assets/onad4.png', 'assets/onad7.png'],
      'statistics': [
        {
          'percentage': '73%',
          'description': 'Trust Score\nin AI guided trading'
        },
        {
          'percentage': '15%',
          'description': 'Traffic ranking in\nreturning users'
        }
      ],
      'tags': ['MOBILE', 'WEB', 'Cryptocurrency', 'Investments', 'Flutter']
    },
    {
      'id': '06',
      'title': 'Investment Cove built with Flutter',
      'images': ['assets/cove2.png', 'assets/cove6.png'],
      'statistics': [
        {
          'percentage': '8%',
          'description': 'Foreign Direct Investment\nDecline in 2024'
        },
        {
          'percentage': '5%',
          'description': 'Increase in\nMutual funds \nand ETFs'
        }
      ],
      'tags': ['MOBILE', 'WEB', 'Investments', 'Flutter']
    },
    {
      'id': '07',
      'title': 'Royal Express Logistics, Built with FLutter.',
      'images': ['assets/royalexpress1.png', 'assets/royalexpress3.png'],
      'statistics': [
        {
          'percentage': '25%',
          'description': 'Increase in\nsuccessful placements'
        },
        {'percentage': '15%', 'description': 'Reduction in\ndelivery time'}
      ],
      'tags': [
        'LOGISTICS',
        'SHIPPING',
        'ENTERPRISE',
        'MOBILE',
        'WEB',
        'FLUTTER'
      ]
    },
    {
      'id': '08',
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
      'id': '09',
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

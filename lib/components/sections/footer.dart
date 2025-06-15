import 'package:flutter/material.dart';
import 'package:portfolio_web/components/widgets/social_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_theme.dart';
import '../lottie/work_together_lottie.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => FooterSectionState();
}

class FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
        decoration: AppTheme.glowingContainer,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 40),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'INTERESTED IN',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 80, child: HandWaveLottie()),
                    ],
                  ),
                  const Text(
                    'WORKING TOGETHER?',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Contact me:',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: 'greendlyguosadia@gmail.com',
                              query: 'subject=Hello',
                            );
                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri);
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'greendlyguosadia@gmail.com',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.mouse_outlined,
                                size: 16,
                                weight: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Design & Developed\nby GreendlyOsaGuosadia',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SocialButton(
                        text: 'INSTAGRAM',
                        onTap: () => _launchURL(
                            'https://www.instagram.com/greendly_guos/#'),
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        text: 'X',
                        onTap: () => _launchURL('https://x.com/3rigx'),
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        text: 'LINKEDIN',
                        onTap: () => _launchURL(
                            'https://www.linkedin.com/in/greendly-guos/'),
                      ),
                    ],
                  ),
                  Text(
                    '© 2025 - All Rights Reserved',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    //final Uri url = Uri.parse(url);
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

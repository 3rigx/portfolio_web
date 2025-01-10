import 'package:flutter/material.dart';
import 'package:portfolio_web/components/widgets/social_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 40),
            const Column(
              children: [
                Row(
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
                Text(
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
                    Text(
                      'Contact me:',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'greendlyguosadia@gmail.com',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.mouse_outlined,
                          size: 16,
                          weight: 60,
                        ),
                      ],
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
                const Text(
                  'Design & Developed\nby GreendlyOsaGuosadia',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    SocialButton(
                      text: 'INSTAGRAM',
                      onTap: () => _launchURL('https://instagram.com'),
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                      text: 'X',
                      onTap: () => _launchURL('https://x.com'),
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                      text: 'LINKEDIN',
                      onTap: () => _launchURL('https://linkedin.com'),
                    ),
                  ],
                ),
                const Text(
                  '© 2025 - All Rights Reserved\nBack to top ↑',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    }
  }
}

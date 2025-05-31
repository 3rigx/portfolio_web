import 'package:flutter/material.dart';

class ContentSection extends StatefulWidget {
  const ContentSection({super.key});

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  bool _showTitle = false;
  bool _showDescription = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _showTitle = true);
      Future.delayed(const Duration(milliseconds: 400), () {
        setState(() => _showDescription = true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _showTitle ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 600),
            child: AnimatedSlide(
              offset: _showTitle ? Offset.zero : const Offset(0, -0.2),
              duration: const Duration(milliseconds: 600),
              child: const Text(
                'Greendly Osa Guosadia',
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  //   color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          AnimatedOpacity(
            opacity: _showDescription ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 600),
            child: AnimatedSlide(
              offset: _showDescription ? Offset.zero : const Offset(0, 0.2),
              duration: const Duration(milliseconds: 600),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'is a passionate and skilled software engineer who specializes in cross-platform mobile and web development, dedicated to creating engaging and user-friendly applications.',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            //   color: Theme.of(context).colorScheme.primary,
                            height: 1.2,
                          ),
                      softWrap: true,
                    ),
                  ),
                  const Flexible(flex: 2, child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

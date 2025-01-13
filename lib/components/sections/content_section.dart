import 'package:flutter/material.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Greendly Osa Guosadia',
            style: TextStyle(
              fontSize: 120,
              fontWeight: FontWeight.bold,
              //   color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  'is A passionate cross-platform mobile and web developer dedicated to creating engaging and user-friendly applications.',
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
        ],
      ),
    );
  }
}

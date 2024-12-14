import 'package:flutter/material.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Greendly Osa Guosadia',
            style: TextStyle(
              fontSize: 130,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  'is A passionate cross-platform mobile and web developer dedicated to creating engaging and user-friendly applications.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  softWrap: true,
                ),
              ),
              Flexible(flex: 2, child: SizedBox()),
            ],
          ),
  
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';

import 'stack_card.dart';

class MyStacks extends StatelessWidget {
  const MyStacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Stacks',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Commitment to staying updated with the latest design trends and techniques.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            height: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                crossAxisCount: constraints.maxWidth > 700 ? 3 : 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 5,
                children: const [
                  BuildToolCard(
                    'logo/c-sharp.png',
                    'C#',
                    'Programing Language Tool',
                  ),
                  BuildToolCard(
                    'logo/python.png',
                    'Python',
                    'Programing Language Tool',
                  ),
                  BuildToolCard(
                    'logo/java.jpeg',
                    'JAVA',
                    'Programing Language Tool',
                  ),
                  BuildToolCard(
                    'logo/Dart.png',
                    'Dart',
                    'Programing Language Tool',
                  ),
                  BuildToolCard(
                    'logo/flutter.png',
                    'Flutter',
                    'Development Tool',
                  ),
                  BuildToolCard(
                    'logo/wordpress.png',
                    'WordPress',
                    'Development & Content Management System Tool',
                  ),
                  BuildToolCard(
                    'logo/tableau.png',
                    'Tableau',
                    'Data Visualization Tool',
                  ),
                  BuildToolCard(
                    'logo/firebase.png',
                    'Google Firebase',
                    'Development & Productivity Tool',
                  ),
                  BuildToolCard(
                    'logo/ms-sq.png',
                    'SQL Server Management Studio',
                    'Relational Database Management System',
                  ),
                  BuildToolCard(
                    'logo/SQLite.png',
                    'SQLite',
                    'Lightweight Database Tool',
                  ),
                  BuildToolCard(
                    'logo/git.png',
                    'Git',
                    'Version Control System Tool',
                  ),
                  BuildToolCard(
                    'logo/github.png',
                    'GitHub',
                    'Hosting and collaborating Tool',
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

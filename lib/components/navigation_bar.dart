import 'package:flutter/material.dart';

class NavigationBarNew extends StatelessWidget {
  final BuildContext parentContext;

  const NavigationBarNew(this.parentContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          const Card(
            color: Colors.white,
            elevation: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  '3rigx',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                )),
          ),

          // Center Navigation
          Card(
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 5,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var item in ['experiments', 'portfolio', 'about'])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Contact Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
            ),
            child: const Text(
              'contact',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

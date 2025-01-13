import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/components/widgets/hoverable_card.dart';

class NavigationBarNew extends StatelessWidget {
  final BuildContext parentContext;

  const NavigationBarNew(this.parentContext, {super.key});

  @override
  Widget build(BuildContext context) {
    final buttonActions = getButtonActions(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          const HoverableCard(
            child: Card(
              color: Colors.black,
              // elevation: 1,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Text(
                    '3rigx',
                  )),
            ),
          ),

          // Center Navigation
          HoverableCard(
            child: Card(
              color: Colors.black,
              //elevation: 1,
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
                          onPressed: buttonActions[item],
                          child: Text(
                            item,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Contact Button
          ElevatedButton(
            onPressed: () {},
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.white,
            //   foregroundColor: Colors.black,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 24,
            //     vertical: 15,
            //   ),
            // ),
            child: const Text(
              'contact',
              // style: TextStyle(
              //   color: Colors.black87,
              //   fontSize: 16,
              // ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, VoidCallback> getButtonActions(BuildContext context) {
    return {
      'experiments': () {
        context.goNamed('experiments');
      },
      'portfolio': () {
        context.goNamed('home');
      },
      'about': () {
        context.goNamed('about');
      },
    };
  }
}

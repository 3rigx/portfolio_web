import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/components/widgets/hoverable_card.dart';
import 'package:portfolio_web/theme/app_colors.dart';

enum PageState { loading, error, content }

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with TickerProviderStateMixin {
  // Current state of the page
  PageState _currentPageState = PageState.loading;
  // Animation controller for the loading animation
  late AnimationController _loadingController;
  // Animation controller for the error screen transition
  late AnimationController _errorController;
  // Animation controller for the final content transition
  late AnimationController _contentController;
  // Animation for the opacity of the final content
  late Animation<double> _contentOpacity;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controllers
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Loop the loading animation

    _errorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Define the opacity animation for the final content
    _contentOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _contentController,
        curve: Curves.easeIn,
      ),
    );

    // Start the sequence of state transitions
    _startSequence();
  }

  @override
  void dispose() {
    // Dispose all controllers to free up resources
    _loadingController.dispose();
    _errorController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  /// Manages the sequence of page state transitions.
  void _startSequence() {
    // 1. Show loading for 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentPageState = PageState.error;
        });
        _errorController.forward(); // Start the error screen animation
      }

      // 2. Show error screen for 3 seconds
      Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _currentPageState = PageState.content;
          });
          _contentController.forward(); // Start the final content animation
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        transitionBuilder: (Widget child, Animation<double> animation) {
          // Use a fade transition between the different page states
          return FadeTransition(opacity: animation, child: child);
        },
        child: _buildCurrentStateWidget(),
      ),
    );
  }

  Widget _buildCurrentStateWidget() {
    switch (_currentPageState) {
      case PageState.loading:
        return _buildLoadingScreen();
      case PageState.error:
        return _buildErrorScreen();
      case PageState.content:
        return _buildContentScreen();
      // Should not happen
    }
  }

  /// Builds the initial loading screen widget.
  Widget _buildLoadingScreen() {
    return Container(
      key: const ValueKey('loading'),
      color: Colors.black,
      child: Center(
        child: RotationTransition(
          turns: _loadingController,
          child: const Icon(
            Icons.sync,
            color: AppColors.primary,
            size: 50,
          ),
        ),
      ),
    );
  }

  /// Builds the red error screen widget, mimicking the provided image.
  Widget _buildErrorScreen() {
    return Container(
      key: const ValueKey('error'),
      color: const Color(0xffD32F2F), // A deep red color
      child: Center(
        child: ScaleTransition(
          scale: CurvedAnimation(
              parent: _errorController, curve: Curves.elasticOut),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The "X X" eyes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildEye(),
                  const SizedBox(width: 60),
                  _buildEye(),
                ],
              ),
              const SizedBox(height: 40),
              // The sad mouth
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 12),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper widget to build one of the 'X' eyes for the error screen.
  Widget _buildEye() {
    return const Icon(
      Icons.close,
      color: Colors.white,
      size: 80,
      weight: 10,
    );
  }

  /// Builds the final content screen with contact information.
  Widget _buildContentScreen() {
    final buttonActions = getButtonActions(context);
    // Use LayoutBuilder for responsive design
    return LayoutBuilder(
      key: const ValueKey('content'),
      builder: (context, constraints) {
        // Adjust text size based on screen width for better responsiveness
        final double baseFontSize = constraints.maxWidth > 600 ? 28 : 18;
        final double iconSize = constraints.maxWidth > 600 ? 120 : 50;
        return SizedBox(
          width: double.infinity,
          child: FadeTransition(
            opacity: _contentOpacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: const Color(0xffD32F2F),
                  size: iconSize,
                ),
                const SizedBox(height: 40),
                Text(
                  "OH NO!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[300],
                    fontSize: baseFontSize * 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "SOMETHING WRONG\nWITH THE\nCONTACT PAGE.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[300],
                    fontSize: baseFontSize,
                    height: 1.5, // Line height
                  ),
                ),
                const SizedBox(height: 60),
                // A simple animated button
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.8, end: 1.0),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, double scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: child,
                    );
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      // Add contact functionality here
                    },
                    //    color: Colors.white,

                    child: Text(
                      'CONTACT ME!',
                      style: TextStyle(
                          fontSize: baseFontSize, fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
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
                          for (var item in [
                            'experiments',
                            'portfolio',
                            'about'
                          ])
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
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
              ],
            ),
          ),
        );
      },
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

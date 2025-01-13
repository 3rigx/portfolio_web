import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/pages/portfolio_page.dart';

import 'pages/About/about.dart';
import 'pages/Error/error.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const PortfolioPage(),
      routes: [
        GoRoute(
          path: 'about',
          name: 'about',
          builder: (context, state) => const AboutPage(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}

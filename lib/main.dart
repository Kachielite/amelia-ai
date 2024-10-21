import 'package:amelia/src/feature/onboarding/presentation/page/onboarding_page.dart';
import 'package:amelia/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amelia AI',
      theme: AppTheme.appTheme,
      home: const OnboardingPage(),
    );
  }
}

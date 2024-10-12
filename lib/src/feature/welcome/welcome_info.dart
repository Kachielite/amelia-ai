import 'package:flutter/material.dart';

import '../../shared/presentation/theme.dart';

class WelcomeInfo extends StatelessWidget {
  const WelcomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Welcome to',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'AmeIia AI 👋',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40,
              color: AppTheme.secondaryColor),
        )
      ],
    );
  }
}

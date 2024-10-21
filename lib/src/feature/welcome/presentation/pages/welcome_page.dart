import 'package:amelia/src/feature/welcome/presentation/widgets/welcome_cta.dart';
import 'package:amelia/src/feature/welcome/presentation/widgets/welcome_info.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/simple_logo.png'),
              const WelcomeInfo(),
              const WelcomeCTA()
            ],
          ),
        ));
  }
}

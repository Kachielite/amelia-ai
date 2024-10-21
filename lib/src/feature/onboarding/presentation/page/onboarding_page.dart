import 'package:amelia/src/feature/onboarding/presentation/widgets/onboarding_cta.dart';
import 'package:amelia/src/feature/onboarding/presentation/widgets/onboarding_slide.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/onboarding/onboarding_constants.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() {
    return _OnboardingPageState();
  }
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff181A20),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      lastPage = index == 2;
                    });
                  },
                  children: onboardingScreens.map((screen) {
                    return OnboardingSlide(screen);
                  }).toList()),
            ),
            const SizedBox(
              height: 32,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: onboardingScreens.length,
              effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Color(0xff17CE92),
                  dotColor: Color(0xff35383F)),
            ),
            const SizedBox(
              height: 40,
            ),
            OnboardingCTA(_controller, lastPage)
          ],
        ));
  }
}

import 'package:amelia/src/feature/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide(this.item, {super.key});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: 60, right: 0, left: 0, child: Image.asset(item.image)),
        Positioned(
            bottom: -110,
            right: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.fromRGBO(24, 26, 32, 0.0),
                        Color.fromRGBO(24, 26, 32, 0.5),
                        Color.fromRGBO(24, 26, 32, 0.9),
                        Color.fromRGBO(24, 26, 32, 1.0)
                      ])),
                ),
                Container(
                  height: 300,
                  color: const Color(0XFF181A20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  child: Column(
                    children: [
                      Text(item.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        item.description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}

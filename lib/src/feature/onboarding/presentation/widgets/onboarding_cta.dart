import 'package:amelia/src/feature/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingCTA extends StatelessWidget {
  const OnboardingCTA(this.controller, this.lastPage, {super.key});

  final PageController controller;
  final bool lastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0XFF35383F)))),
      padding: const EdgeInsets.only(top: 24, left: 24, right: 26, bottom: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                controller.jumpToPage(2);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff35383F),
                  textStyle: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  fixedSize: const Size(150, 55)),
              child: const Text("Skip")),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                lastPage
                    ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                        return const WelcomePage();
                      }))
                    : controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff17CE92),
                  textStyle: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  fixedSize: const Size(150, 55)),
              child: Text(lastPage ? "Done" : "Next")),
        ],
      ),
    );
  }
}

import 'package:amelia/src/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomDialogue extends StatelessWidget {
  final String image;
  final String title;

  const CustomDialogue({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      backgroundColor: AppPallete.backgroundColor,
      content: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                image,
                width: 186,
                height: 180,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: AppPallete.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Please wait...',
                style: TextStyle(
                    color: AppPallete.primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
              const Text(
                'Please wait...\nYou will be directed to the homepage.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const CircularProgressIndicator(
                color:
                    AppPallete.primaryColor, // Customize the progress indicator
              ),
            ],
          ),
        ),
      ),
    );
  }
}

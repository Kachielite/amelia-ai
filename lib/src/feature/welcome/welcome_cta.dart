import 'package:amelia/src/feature/signup/signup_page.dart';
import 'package:amelia/src/shared/presentation/custom_widgets/form_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeCTA extends StatelessWidget {
  const WelcomeCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
            onPressed: () {}, label: "Log in", type: ButtonType.primary),
        const SizedBox(
          height: 24,
        ),
        CustomButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SignUpPage();
              }));
            },
            label: "Sign up",
            type: ButtonType.secondary),
      ],
    );
  }
}

import 'package:amelia/src/feature/login/presentation/pages/login_page.dart';
import 'package:amelia/src/feature/signup/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/form/custom_button.dart';



class WelcomeCTA extends StatelessWidget {
  const WelcomeCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
            label: "Log in",
            type: ButtonType.primary),
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

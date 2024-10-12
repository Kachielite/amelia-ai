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
            onPressed: () {}, label: "Sign up", type: ButtonType.secondary),
      ],
    );
  }
}

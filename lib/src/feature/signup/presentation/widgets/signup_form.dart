import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../shared/presentation/widgets/form/custom_checkbox.dart';
import '../../../../shared/presentation/widgets/form/custom_input_field.dart';
import '../../../../shared/presentation/widgets/form/custom_password_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomInputField(
          label: "Email",
          icon: Icons.email,
          controller: emailController,
        ),
        const SizedBox(
          height: 24,
        ),
        CustomPasswordField(
          label: "Password",
          controller: passwordController,
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckbox(isChecked: false, onChanged: (value) {}),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: RichText(
                  text:
                      const TextSpan(text: 'I agree to Amelia AI ', children: [
                TextSpan(
                    text: 'Public Agreement, Terms & Privacy Policy',
                    style:
                        TextStyle(color: AppPallete.primaryColor, height: 1.5))
              ])),
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/form/custom_input_field.dart';
import '../../../../shared/presentation/widgets/form/custom_password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
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
          height: 30,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CustomCheckbox(isChecked: true, onChanged: (value) {}),
            SizedBox(
              width: 4,
            ),
            Text('Remember me')
          ],
        )
      ],
    );
  }
}

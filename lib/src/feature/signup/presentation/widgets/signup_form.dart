import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../shared/presentation/widgets/form/custom_checkbox.dart';
import '../../../../shared/presentation/widgets/form/custom_input_field.dart';
import '../../../../shared/presentation/widgets/form/custom_password_field.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomInputField(
            label: "Email",
            initialValue: "",
            icon: Icons.email,
            validator: (value) {
              print(value);
            },
            onSaved: (value) {
              print(value);
            }),
        const SizedBox(
          height: 24,
        ),
        CustomPasswordField(
            label: "Password",
            initialValue: "",
            validator: (value) {
              print(value);
            },
            onSaved: (value) {
              print(value);
            }),
        const SizedBox(
          height: 30,
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
                  text: const TextSpan(text: 'I agree to Amelia AI', children: [
                TextSpan(text: ' '),
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

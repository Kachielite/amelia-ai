import 'package:amelia/src/shared/presentation/custom_widgets/form_widgets/custom_checkbox.dart';
import 'package:amelia/src/shared/presentation/custom_widgets/form_widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

import '../../shared/presentation/theme.dart';

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
        CustomInputField(
            label: "Password",
            initialValue: "",
            icon: Icons.remove_red_eye,
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
                        TextStyle(color: AppTheme.secondaryColor, height: 1.5))
              ])),
            )
          ],
        )
      ],
    );
  }
}

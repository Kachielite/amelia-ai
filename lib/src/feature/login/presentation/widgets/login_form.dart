
import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/form_widgets/custom_checkbox.dart';
import '../../../../shared/presentation/widgets/form_widgets/custom_input_field.dart';
import '../../../../shared/presentation/widgets/form_widgets/custom_password_field.dart';



class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(isChecked: true, onChanged: (value) {}),
            const SizedBox(
              width: 4,
            ),
            const Text('Remember me')
          ],
        )
      ],
    );
  }
}

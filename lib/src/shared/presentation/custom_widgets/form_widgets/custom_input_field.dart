import 'package:flutter/material.dart';

import '../../theme.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.label,
      required this.initialValue,
      required this.validator,
      required this.onSaved,
      required this.icon});

  final String label;
  final String initialValue;
  final void Function(String value) validator;
  final void Function(String value) onSaved;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.secondaryColor, // Default border color
                  width: 1.0, // Border thickness
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white, // Focused border color
                  width: 2.0, // Border thickness when focused
                ),
              ),
              hintStyle: const TextStyle(color: Color(0XFF35383F)),
              hintText: label, // Placeholder text
              suffixIcon: InkWell(
                child: Icon(
                  icon,
                  size: 28,
                ),
              )),
          initialValue: initialValue,
          keyboardType: TextInputType.name,
        )
      ],
    );
  }
}

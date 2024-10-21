import 'package:amelia/src/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {super.key, required this.isChecked, required this.onChanged});

  final bool isChecked;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {
        onChanged(value!);
      },
      activeColor: AppPallete.primaryColor,
      checkColor: Colors.white,
      side: const BorderSide(color: AppPallete.secondaryColor, width: 2.0),
    );
  }
}

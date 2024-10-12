import 'package:amelia/src/shared/presentation/theme.dart';
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
      activeColor: AppTheme.secondaryColor,
      checkColor: Colors.white,
      side: const BorderSide(color: AppTheme.secondaryColor, width: 2.0),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class CustomInputField extends StatefulWidget {
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
  State<StatefulWidget> createState() {
    return _CustomInputFieldState();
  }
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;
  late bool _isFocused;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isFocused = false;

    // Add a listener to update the focus state
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Clean up the focus node when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          cursorColor: Colors.white,
          focusNode: _focusNode, // Attach the focus node to the TextFormField
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: AppPallete.placeholderColor),
              hintText: widget.label, // Placeholder text
              suffixIcon: InkWell(
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: _isFocused
                      ? AppPallete.whiteColor
                      : AppPallete.primaryColor, // Change icon color based on focus
                ),
              )),
          initialValue: widget.initialValue,
          keyboardType: TextInputType.name,
        )
      ],
    );
  }
}

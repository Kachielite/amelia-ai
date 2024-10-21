import 'package:amelia/src/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';


class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {super.key,
      required this.label,
      required this.initialValue,
      required this.validator,
      required this.onSaved});

  final String label;
  final String initialValue;
  final void Function(String value) validator;
  final void Function(String value) onSaved;

  @override
  State<CustomPasswordField> createState() {
    return _CustomPasswordFieldState();
  }
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late FocusNode _focusNode;
  late bool _isFocused;
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isFocused = false;
    _isObscured = true; // Initially, the password is obscured

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
          focusNode: _focusNode, // Attach the focus node to the TextFormField
          obscureText: _isObscured, // Control whether the text is obscured
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Color(0XFF35383F)),
              hintText: widget.label, // Placeholder text
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured
                      ? Icons.visibility_off
                      : Icons.visibility, // Toggle icon
                  size: 28,
                  color: _isFocused
                      ? AppPallete.whiteColor
                      : AppPallete.primaryColor, // Change icon color based on focus
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle password visibility
                  });
                },
              )),
          initialValue: widget.initialValue,
          keyboardType: TextInputType
              .visiblePassword, // Set keyboard type for password input
        )
      ],
    );
  }
}

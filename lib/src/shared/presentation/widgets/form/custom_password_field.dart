import 'package:amelia/src/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {super.key, required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

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
          controller: widget.controller,
          focusNode: _focusNode,
          // Attach the focus node to the TextFormField
          obscureText: _isObscured,
          // Control whether the text is obscured
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
                      : AppPallete
                          .primaryColor, // Change icon color based on focus
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle password visibility
                  });
                },
              )),
          keyboardType: TextInputType.visiblePassword,
          obscuringCharacter: '*',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Password is required';
            }
            return null;
          }, // Set keyboard type for password input
        )
      ],
    );
  }
}

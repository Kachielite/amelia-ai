import 'package:flutter/material.dart';

class SignUpInfo extends StatelessWidget {
  const SignUpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello there 👋',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Please enter your email & password to create an account.',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back 👋',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Please enter your email & password to log in.',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}

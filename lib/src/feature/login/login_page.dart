import 'package:amelia/src/feature/login/login_form.dart';
import 'package:amelia/src/feature/signup/signup_info.dart';
import 'package:amelia/src/feature/signup/signup_page.dart';
import 'package:amelia/src/shared/presentation/custom_widgets/form_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../shared/presentation/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Added SingleChildScrollView to handle overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 32),
                margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0XFF35383F)))),
                child: const Column(
                  children: [
                    SignUpInfo(),
                    SizedBox(
                      height: 32,
                    ),
                    LoginForm(),
                  ],
                ),
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: AppTheme.secondaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignUpPage();
                          }));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              color: AppTheme.secondaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0XFF35383F)))),
                padding: const EdgeInsets.only(
                    top: 24, left: 24, right: 26, bottom: 32),
                child: CustomButton(
                    onPressed: () {},
                    label: 'Log in',
                    type: ButtonType.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

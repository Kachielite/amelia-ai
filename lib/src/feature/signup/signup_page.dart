import 'package:amelia/src/feature/login/login_page.dart';
import 'package:amelia/src/feature/signup/signup_form.dart';
import 'package:amelia/src/feature/signup/signup_info.dart';
import 'package:amelia/src/shared/presentation/custom_widgets/form_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../shared/presentation/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
        ),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 24, left: 24, right: 24, bottom: 24),
                    child: const Column(
                      children: [
                        SignUpInfo(),
                        SizedBox(
                          height: 50,
                        ),
                        SignUpForm(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                                color: AppTheme.secondaryColor,
                                fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border:
                            Border(top: BorderSide(color: Color(0XFF35383F)))),
                    padding: const EdgeInsets.only(
                        top: 24, left: 24, right: 26, bottom: 36),
                    child: CustomButton(
                        onPressed: () {},
                        label: 'Continue',
                        type: ButtonType.primary),
                  )
                ],
              ),
            ))
          ],
        )));
  }
}
